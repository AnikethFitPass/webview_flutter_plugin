import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class WebViewPluginView extends StatefulWidget {
  const WebViewPluginView({super.key});

  @override
  State<WebViewPluginView> createState() => _WebViewPluginViewState();
}

class _WebViewPluginViewState extends State<WebViewPluginView> {
  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: 'webview_flutter_plugin',
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
