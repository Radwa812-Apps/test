import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../Features/home/data/services/api_services.dart';
import '../Features/home/data/services/home_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiServices>()),
  );
}
