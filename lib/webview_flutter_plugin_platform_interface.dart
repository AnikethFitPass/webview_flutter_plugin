import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webview_flutter_plugin_method_channel.dart';

abstract class WebviewFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a WebviewFlutterPluginPlatform.
  WebviewFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static WebviewFlutterPluginPlatform _instance = MethodChannelWebviewFlutterPlugin();

  /// The default instance of [WebviewFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelWebviewFlutterPlugin].
  static WebviewFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WebviewFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(WebviewFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
