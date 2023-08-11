// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:reddit_feed/model/auth_token.dart';
// import 'package:reddit_feed/services/network_service.dart';

// final networkProvider = Provider<NetworkService>((ref) {
//   return NetworkService();
// });

// // final accessTokenProvider = FutureProvider<String>((ref) async {
// //   final network = ref.watch(networkProvider);

// //   return network.getAccessToken("code");
// // });

// final accessTokenProvider =
//     FutureProvider.family<String, String>((ref, code) async {
//   final network = ref.watch(networkProvider);

//   final authToken = await network.getAccessToken(code);

//   return authToken;
// });
