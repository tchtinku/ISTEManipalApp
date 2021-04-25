import 'package:get_it/get_it.dart';
import 'package:istemanipalapp/logic/viewmodels/authViewModel.dart';
import 'package:istemanipalapp/logic/viewmodels/blogViewModel.dart';
import 'package:istemanipalapp/logic/viewmodels/categoryViewModel.dart';
import 'package:istemanipalapp/logic/viewmodels/interviewViewModel.dart';
import 'package:istemanipalapp/services/api.dart';
import 'package:istemanipalapp/services/blogApi.dart';
import 'package:istemanipalapp/services/dialogService.dart';
import 'package:istemanipalapp/services/storageService.dart';
import 'package:istemanipalapp/services/themeManager.dart';
import './navigationService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => BlogApi());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton<ThemeManager>(() => ThemeManager.initialize());
  locator.registerLazySingleton(() => DialogService());

  //viewModels
  locator.registerLazySingleton(() => AuthViewModel.initialize());
  locator.registerLazySingleton(() => BlogViewModel.initialize());
  locator.registerLazySingleton(() => CategoryViewModel.initialize());
  locator.registerLazySingleton(() => InterviewViewModel.initialize());
}
