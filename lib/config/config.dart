abstract class Config {
  /// 请求url
  String get baseUrl => "http://localhost:5590/http/";
}

/// 开发环境
class ConfigDebug extends Config {
  @override
  String get baseUrl => "http://localhost:5590/http/";
}

/// 预发布环境
class ConfigPreview extends Config {}

/// 生产环境
class ConfigProduct extends Config {}
