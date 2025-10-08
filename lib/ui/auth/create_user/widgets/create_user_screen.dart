import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:fiap_farms/ui/auth/create_user/stores/create_user_store.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';
import 'package:fiap_farms/routing/routes.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final CreateUserStore _store = sl<CreateUserStore>();

  @override
  void initState() {
    super.initState();
    reaction((_) => _store.errorMessage, (String? message) {
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        leading: IconButton(
          onPressed: () => context.go(Routes.login),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Observer(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    onChanged: _store.setFullName,
                    decoration: InputDecoration(
                      labelText: 'Nome completo',
                      errorText: _store.fullNameError,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    onChanged: _store.setFarmName,
                    decoration: InputDecoration(
                      labelText: 'Nome da fazenda',
                      errorText: _store.farmNameError,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    onChanged: _store.setEmail,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      errorText: _store.emailError,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    onChanged: _store.setPassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      errorText: _store.passwordError,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 32),
                  FilledButton(
                    onPressed: !_store.isLoading ? _store.createUser : null,
                    child: _store.isLoading
                        ? const CircularProgressIndicator(
                            constraints: BoxConstraints.tightFor(
                              width: 24,
                              height: 24,
                            ),
                          )
                        : const Text('Criar conta'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
