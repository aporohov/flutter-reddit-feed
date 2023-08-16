import 'package:dio/dio.dart';
import 'package:reddit_feed/model/reddit_post/reddit_post.dart';

final _dio = Dio();

Future<List<RedditPost>> getFlutterPosts() async {
  final response =
      await _dio.get("https://www.reddit.com/r/flutterdev/new.json");
  return _mapPosts(response);
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

      if (data.containsKey("thumbnail")) {
        data["thumbnail_url"] = data["thumbnail"];
      }

      final post = RedditPost.fromJson(data);
      posts.add(post);
    }

    return posts;
  } catch (error) {
    rethrow;
  }
}
