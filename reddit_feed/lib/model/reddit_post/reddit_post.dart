// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reddit_post.freezed.dart';
part 'reddit_post.g.dart';

@freezed
class RedditPost with _$RedditPost {
  factory RedditPost({
    required String id,
    required String title,
    required String selftext,
    required String? thumbnail_url,
  }) = _RedditPost;

  factory RedditPost.fromJson(Map<String, dynamic> json) =>
      _$RedditPostFromJson(json);
}
