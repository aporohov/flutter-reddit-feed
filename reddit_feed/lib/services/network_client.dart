// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import 'package:reddit_feed/model/auth_token.dart';

// class NetworkService {
//   Future<String> getAccessToken(String code) async {
//     final response = await http.post(
//         Uri.parse('https://www.reddit.com/api/v1/access_token'),
//         body: {"code": code, "grant_type": "authorization_code"});

//     if (response.statusCode == 200) {
//       final jsonResponse =
//           convert.jsonDecode(response.body) as Map<String, dynamic>;
//       final accessToken = jsonResponse['accessToken'];
//       final refreshToken = jsonResponse['refreshToken'];
//       print(jsonResponse);
//       print(accessToken);
//       print(refreshToken);

//       return accessToken;
//     } else {
//       throw ("token access failure");
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:reddit_feed/model/reddit_post/reddit_post.dart';
import 'dart:convert';

final _dio = Dio();

Future<List<RedditPost>> getFlutterPosts() async {
  // final response =
  //     await _dio.get("https://www.reddit.com/r/flutterdev/new.json");

  final map = jsonDecode(aaa);

  final resp = Response(data: map, requestOptions: RequestOptions());
  return _mapPosts(resp);
  // return _mapPosts(response);
}

Future<List<RedditPost>> getPosts({required String searchText}) async {
  final response = await _dio.get("http://www.reddit.com/search.json",
      queryParameters: {"q": searchText});

  return _mapPosts(response);
}

List<RedditPost> _mapPosts(Response<dynamic> response) {
  try {
    final postMaps = response.data["data"]["children"];

    final List<RedditPost> posts = [];

    for (var element in postMaps) {
      final data = element["data"] as Map<String, dynamic>;

      if (data.containsKey("preview")) {
        final images = data["preview"]["images"] as List;

        data["thumbnail_url"] = images.first["source"]["url"];
      }

      final post = RedditPost.fromJson(data);
      posts.add(post);
    }

    return posts;
  } catch (error) {
    rethrow;
  }
}

final aaa = """{
  "kind": "Listing",
  "data": {
    "after": "t3_15ktihq",
    "dist": 25,
    "children": [
      {
        "kind": "t3",
        "data": {
          "id": "54nk45",
          "title": "Any Whitelabel suggestions/advice ?",
          "author": "jennataiga",
          "selftext": "adjhkafna adfjnkjdnf afdjnadjnf"
        }
      }
    ]
    }
  }""";
