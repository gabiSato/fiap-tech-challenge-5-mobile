import 'package:mobx/mobx.dart';

import 'package:fiap_farms/domain/use_cases/auth/logout_usecase.dart';
import 'package:fiap_farms/utils/result.dart';

part 'logout_store.g.dart';

class LogoutStore = LogoutStoreBase with _$LogoutStore;

abstract class LogoutStoreBase with Store {
  final LogoutUseCase _logoutUseCase;

  LogoutStoreBase(this._logoutUseCase);

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> logout() async {
    isLoading = true;
    errorMessage = null;

    final result = await _logoutUseCase.call();
    isLoading = false;

    if (result is Error<void>) {
      errorMessage = result.error.toString();
    }
  }
}
