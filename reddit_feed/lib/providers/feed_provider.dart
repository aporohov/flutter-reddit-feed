import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/model/feed_state/feed_state.dart';
import 'package:reddit_feed/services/network_client.dart';

/// Провайдер страницы новостей
final feedProvider = StateNotifierProvider<FeedNotifier, FeedState>((ref) {
  return FeedNotifier();
});

class FeedNotifier extends StateNotifier<FeedState> {
  FeedNotifier() : super(FeedState()) {
    loadPosts();
  }

  loadPosts() async {
    state = state.copyWith(isLoading: true, isError: false);

    getFlutterPosts().then((posts) {
      state = state.copyWith(posts: posts, isLoading: false);
    }).catchError((error, stackTrace) {
      state = state.copyWith(posts: [], isLoading: false, isError: true);
    });
  }
}
