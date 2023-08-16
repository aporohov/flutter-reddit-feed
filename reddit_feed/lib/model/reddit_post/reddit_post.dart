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
    required String thumbnail,
    required int? thumbnail_width,
    required int? thumbnail_height,
    required int ups,
    required int downs,
    required int? num_comments,
  }) = _RedditPost;

  factory RedditPost.fromJson(Map<String, dynamic> json) =>
      _$RedditPostFromJson(json);
}
