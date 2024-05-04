import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'webview_flutter_plugin_platform_interface.dart';

/// An implementation of [WebviewFlutterPluginPlatform] that uses method channels.
class MethodChannelWebviewFlutterPlugin extends WebviewFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('webview_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
