import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter_plugin/webview_flutter_plugin.dart';
import 'package:webview_flutter_plugin/webview_flutter_plugin_platform_interface.dart';
import 'package:webview_flutter_plugin/webview_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWebviewFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements WebviewFlutterPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WebviewFlutterPluginPlatform initialPlatform =
      WebviewFlutterPluginPlatform.instance;

  test('$MethodChannelWebviewFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWebviewFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    WebviewFlutterPlugin webviewFlutterPlugin = WebviewFlutterPlugin();
    MockWebviewFlutterPluginPlatform fakePlatform =
        MockWebviewFlutterPluginPlatform();
    WebviewFlutterPluginPlatform.instance = fakePlatform;
  });
}
