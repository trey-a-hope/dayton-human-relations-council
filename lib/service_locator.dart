import 'package:dayton_human_relations_council/services/modal_service.dart';
import 'package:dayton_human_relations_council/services/validation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setUpLocator() {
  locator.registerLazySingleton(() => ModalService());
  locator.registerLazySingleton(() => ValidationService());
}
