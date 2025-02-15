import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:web_demo/config/config.dart';
import 'package:web_demo/core/util/sp_util.dart';
import 'package:web_demo/router/router.dart';
import 'package:web_demo/services/api/api.dart';
import 'package:web_demo/services/platform/platform.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  // 配置项目环境
  if (!kDebugMode) {
    locator.registerSingleton<Config>(ConfigDebug());
  } else {
    locator.registerSingleton<Config>(ConfigProduct());
  }
  final spUtil = await SpUtil.getInstance();
  locator.registerSingleton<SpUtil>(spUtil);
  locator.registerLazySingleton<Router>(() => Router());
  locator.registerFactory<PlatformRepository>(() => PlatformRepositoryImpl());
  locator.registerLazySingleton<Api>(() => ApiImpl());
}

class GetX {
  static Config get config => locator<Config>();
  static Router get router => locator<Router>();
  static Api get api => locator<Api>();
  static PlatformRepository get platform => locator<PlatformRepository>();
  static SpUtil get spUtil => locator<SpUtil>();
}
