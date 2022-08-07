import 'package:get_it/get_it.dart';
import 'package:stacked_example/services/todos.service.dart';




final locator = GetIt.instance; // di для сервиса

setupLocator() {
  locator.registerLazySingleton(() => TodosService());

}