import 'package:flutter/material.dart';

import 'package:fiap_farms/domain/repositories/auth_repository.dart';
import 'package:fiap_farms/dependencies/service_locator.dart';

class RedirectNotifier extends ChangeNotifier {
  bool _isAuthenticated = false;

  RedirectNotifier() {
    final authRepository = sl<AuthRepository>();

    authRepository.authStateChanges().listen((userId) {
      _isAuthenticated = userId != null;
      notifyListeners();
    });
  }

  bool get isAuthenticated => _isAuthenticated;
}
