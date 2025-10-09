import 'package:get_it/get_it.dart';

import 'package:fiap_farms/domain/use_cases/production/get_productions_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/create_credential_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/create_product_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/update_product_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/get_current_user_usecase.dart';
import 'package:fiap_farms/domain/use_cases/product/get_products_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/logout_usecase.dart';
import 'package:fiap_farms/domain/use_cases/auth/login_usecase.dart';

import 'package:fiap_farms/ui/auth/create_user/stores/create_user_store.dart';
import 'package:fiap_farms/ui/production/stores/productions_store.dart';
import 'package:fiap_farms/ui/product/stores/product_list_store.dart';
import 'package:fiap_farms/ui/product/stores/product_form_store.dart';
import 'package:fiap_farms/ui/auth/logout/stores/logout_store.dart';
import 'package:fiap_farms/ui/auth/login/stores/login_store.dart';

void setupUiModule(GetIt sl) {
  sl.registerFactory(() => LoginStore(sl<LoginUseCase>()));
  sl.registerFactory(() => CreateUserStore(sl<CreateCredentialUseCase>()));
  sl.registerFactory(() => LogoutStore(sl<LogoutUseCase>()));
  sl.registerFactory(
    () =>
        ProductListStore(sl<GetCurrentUserUseCase>(), sl<GetProductsUseCase>()),
  );
  sl.registerFactory(
    () => ProductFormStore(
      sl<GetCurrentUserUseCase>(),
      sl<CreateProductUseCase>(),
      sl<UpdateProductUseCase>(),
    ),
  );
  sl.registerFactory(
    () => ProductionsStore(
      sl<GetCurrentUserUseCase>(),
      sl<GetProductionsUseCase>(),
    ),
  );
}
