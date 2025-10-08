import 'package:get_it/get_it.dart';

import 'package:fiap_farms/domain/use_cases/auth/create_credential_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/login_usecase.dart';

import 'package:fiap_farms/ui/auth/create_user/stores/create_user_store.dart';
import 'package:fiap_farms/ui/auth/login/stores/login_store.dart';

void setupUiModule(GetIt sl) {
  sl.registerFactory(() => LoginStore(sl<LoginUseCase>()));
  sl.registerFactory(() => CreateUserStore(sl<CreateCredentialUseCase>()));
}
