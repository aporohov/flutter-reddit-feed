import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reddit_feed/model/reddit_post/reddit_post.dart';

part 'feed_state.freezed.dart';

@freezed
class FeedState with _$FeedState {
  factory FeedState(
      {@Default([]) List<RedditPost> posts,
      @Default(true) bool isLoading,
      @Default(false) bool isError}) = _FeedState;
}
