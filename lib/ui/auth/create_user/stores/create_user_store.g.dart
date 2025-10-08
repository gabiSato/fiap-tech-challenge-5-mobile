// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserStore on CreateUserStoreBase, Store {
  late final _$isLoadingAtom = Atom(
    name: 'CreateUserStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: 'CreateUserStoreBase.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fullNameAtom = Atom(
    name: 'CreateUserStoreBase.fullName',
    context: context,
  );

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  late final _$farmNameAtom = Atom(
    name: 'CreateUserStoreBase.farmName',
    context: context,
  );

  @override
  String get farmName {
    _$farmNameAtom.reportRead();
    return super.farmName;
  }

  @override
  set farmName(String value) {
    _$farmNameAtom.reportWrite(value, super.farmName, () {
      super.farmName = value;
    });
  }

  late final _$emailAtom = Atom(
    name: 'CreateUserStoreBase.email',
    context: context,
  );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: 'CreateUserStoreBase.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$fullNameErrorAtom = Atom(
    name: 'CreateUserStoreBase.fullNameError',
    context: context,
  );

  @override
  String? get fullNameError {
    _$fullNameErrorAtom.reportRead();
    return super.fullNameError;
  }

  @override
  set fullNameError(String? value) {
    _$fullNameErrorAtom.reportWrite(value, super.fullNameError, () {
      super.fullNameError = value;
    });
  }

  late final _$farmNameErrorAtom = Atom(
    name: 'CreateUserStoreBase.farmNameError',
    context: context,
  );

  @override
  String? get farmNameError {
    _$farmNameErrorAtom.reportRead();
    return super.farmNameError;
  }

  @override
  set farmNameError(String? value) {
    _$farmNameErrorAtom.reportWrite(value, super.farmNameError, () {
      super.farmNameError = value;
    });
  }

  late final _$emailErrorAtom = Atom(
    name: 'CreateUserStoreBase.emailError',
    context: context,
  );

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$passwordErrorAtom = Atom(
    name: 'CreateUserStoreBase.passwordError',
    context: context,
  );

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$createUserAsyncAction = AsyncAction(
    'CreateUserStoreBase.createUser',
    context: context,
  );

  @override
  Future<void> createUser() {
    return _$createUserAsyncAction.run(() => super.createUser());
  }

  late final _$CreateUserStoreBaseActionController = ActionController(
    name: 'CreateUserStoreBase',
    context: context,
  );

  @override
  void setFullName(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.setFullName',
    );
    try {
      return super.setFullName(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFarmName(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.setFarmName',
    );
    try {
      return super.setFarmName(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFullName(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.validateFullName',
    );
    try {
      return super.validateFullName(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFarmName(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.validateFarmName',
    );
    try {
      return super.validateFarmName(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.validateEmail',
    );
    try {
      return super.validateEmail(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$CreateUserStoreBaseActionController.startAction(
      name: 'CreateUserStoreBase.validatePassword',
    );
    try {
      return super.validatePassword(value);
    } finally {
      _$CreateUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
fullName: ${fullName},
farmName: ${farmName},
email: ${email},
password: ${password},
fullNameError: ${fullNameError},
farmNameError: ${farmNameError},
emailError: ${emailError},
passwordError: ${passwordError}
    ''';
  }
}
