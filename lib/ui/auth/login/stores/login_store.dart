import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/entities/user_entity.dart';
import 'package:fiap_farms/domain/use_cases/auth/login_usecase.dart';

import 'package:fiap_farms/utils/result.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginUseCase _loginUseCase;

  LoginStoreBase(this._loginUseCase) {
    _setupValidations();
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String? emailError;

  @observable
  String? passwordError;

  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => email, (value) {
        if (emailError != null) {
          validateEmail(value);
        }
      }),
      reaction((_) => password, (value) {
        if (passwordError != null) {
          validatePassword(value);
        }
      }),
    ];
  }

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError = 'E-mail é obrigatório';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      emailError = 'Formato de e-mail inválido';
    } else {
      emailError = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = 'Senha é obrigatória';
    } else {
      passwordError = null;
    }
  }

  bool _validateAll() {
    validateEmail(email);
    validatePassword(password);

    return emailError == null && passwordError == null;
  }

  @action
  Future<void> login() async {
    if (_validateAll()) {
      isLoading = true;
      errorMessage = null;

      final result = await _loginUseCase.call(email: email, password: password);
      isLoading = false;

      if (result is Error<UserEntity>) {
        errorMessage = result.error.toString();
      }
    }
  }

  void dispose() {
    for (final dispose in _disposers) {
      dispose();
    }
  }
}
