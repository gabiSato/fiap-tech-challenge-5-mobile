import 'package:get_it/get_it.dart';

import 'domain_module.dart';
import 'data_module.dart';
import 'ui_module.dart';

final sl = GetIt.instance;

void setupLocator() {
  setupDataModule(sl);
  setupDomainModule(sl);
  setupUiModule(sl);
}
