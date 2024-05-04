import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WebviewFlutterPlugin extends GetxController {
  EventChannel? _eventChannel;
  MethodChannel? _channel;
  Widget? _preview;
  Widget get previewWidget => _preview ?? const SizedBox();

  static RxBool isReady = false.obs;
  @override
  void onInit() {
    setupChannels();
    super.onInit();
  }

  void setupChannels() {
    _channel = const MethodChannel('webview_flutter_plugin');
    _eventChannel = const EventChannel('webview_flutter_plugin');
    isReady.value = true;
    _preview = _getView();
  }

  Widget _getView() {
    if (Platform.isAndroid) {
      return const AndroidView(
        viewType: 'webview_flutter_plugin',
        creationParamsCodec: StandardMessageCodec(),
      );
    }
    return const Center(
      child: Center(
        child: Text(
          'Platform not supported',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Future<void> startBroadcast({
    required String? url,
  }) async {
    debugPrint('inside the plugin');
    if (url!.isEmpty) {
      throw Exception('imgset or streamKey is empty');
    }

    _channel?.invokeMethod<void>('startWebview', <String, dynamic>{'url': url});
    _eventChannel?.receiveBroadcastStream();
  }

  static WebviewFlutterPlugin get instance {
    if (isReady.value) {
      return Get.find<WebviewFlutterPlugin>();
    }
    return Get.put(WebviewFlutterPlugin(), permanent: true);
  }
}
