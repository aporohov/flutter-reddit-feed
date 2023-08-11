// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:reddit_feed/providers/access_token_provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebviewPage extends ConsumerStatefulWidget {
//   const WebviewPage({super.key});

//   @override
//   ConsumerState<WebviewPage> createState() => _WebviewPageState();
// }

// class _WebviewPageState extends ConsumerState<WebviewPage> {
//   final WebViewController _controller =
//       WebViewController.fromPlatformCreationParams(
//           const PlatformWebViewControllerCreationParams())
//         ..setJavaScriptMode(JavaScriptMode.unrestricted)
//         ..setBackgroundColor(Colors.black);

//   @override
//   void initState() {
//     _controller.setNavigationDelegate(NavigationDelegate(
//       onNavigationRequest: (request) {
//         print("QQQQQQ");
//         final parsedUri = Uri.parse(request.url);

//         if (parsedUri.origin + parsedUri.path ==
//             "https://github.com/reddit-archive/reddit/wiki/OAuth2") {
//           final params = parsedUri.queryParameters;

//           final code = params["code"];

//           if (code != null) {
//             ref.read(accessTokenProvider(code));
//           }
//         }
//         return NavigationDecision.navigate;
//       },
//     ));

//     _controller.loadRequest(Uri.parse(
//         'https://www.reddit.com/api/v1/authorize.compact?client_id=gh4MnGuUEnjdUEW8tQECcA&redirect_uri=https://github.com/reddit-archive/reddit/wiki/OAuth2&response_type=code&state=state&duration=permanent&scope=identity%20edit%20flair%20history%20read%20vote%20wikiread%20wikiedit'));

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Webview'),
//         ),
//         body: Center(
//             child: WebViewWidget(
//           controller: _controller,
//         )));
//   }

//   void _getAccessToken(String code) {}
// }
