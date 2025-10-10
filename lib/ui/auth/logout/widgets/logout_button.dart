import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:fiap_farms/ui/auth/logout/stores/logout_store.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  final LogoutStore _store = sl<LogoutStore>();
  late final ReactionDisposer _disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposer = reaction(
      (_) => _store.errorMessage,
      (String? message) {
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return IconButton(
          onPressed: !_store.isLoading ? _store.logout : null,
          icon: const Icon(Icons.logout, color: Colors.white),
        );
      },
    );
  }
}
