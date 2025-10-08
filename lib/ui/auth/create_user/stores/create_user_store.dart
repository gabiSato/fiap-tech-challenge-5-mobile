import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/use_cases/auth/create_credential_usecase.dart';
import 'package:fiap_farms/domain/entities/user_entity.dart';

import 'package:fiap_farms/utils/result.dart';

part 'create_user_store.g.dart';

class CreateUserStore = CreateUserStoreBase with _$CreateUserStore;

abstract class CreateUserStoreBase with Store {
  final CreateCredentialUseCase _createCredentialUseCase;

  CreateUserStoreBase(this._createCredentialUseCase) {
    _setupValidations();
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  String fullName = '';

  @observable
  String farmName = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String? fullNameError;

  @observable
  String? farmNameError;

  @observable
  String? emailError;

  @observable
  String? passwordError;

  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => fullName, (value) {
        if (fullNameError != null) {
          validateFullName(value);
        }
      }),
      reaction((_) => farmName, (value) {
        if (farmNameError != null) {
          validateFarmName(value);
        }
      }),
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
  void setFullName(String value) => fullName = value;

  @action
  void setFarmName(String value) => farmName = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void validateFullName(String value) {
    if (value.isEmpty) {
      fullNameError = 'Nome completo é obrigatório';
    } else {
      fullNameError = null;
    }
  }

  @action
  void validateFarmName(String value) {
    if (value.isEmpty) {
      farmNameError = 'Nome da fazenda é obrigatório';
    } else {
      farmNameError = null;
    }
  }

  @action
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError = 'E-mail é obrigatório';
    } else if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(value)) {
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
    validateFullName(fullName);
    validateFarmName(farmName);
    validateEmail(email);
    validatePassword(password);

    return fullNameError == null &&
        farmNameError == null &&
        emailError == null &&
        passwordError == null;
  }

  @action
  Future<void> createUser() async {
    if (_validateAll()) {
      isLoading = true;
      errorMessage = null;

      final user = UserEntity(
        farmName: farmName,
        ownerName: fullName,
        email: email,
      );

      final result = await _createCredentialUseCase.call(
        email: email,
        password: password,
        user: user,
      );
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
