import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/model/feed_state/feed_state.dart';
import 'package:reddit_feed/services/network_client.dart';

/// Провайдер для строки поиска
final searchTextProvider = StateProvider<String>((ref) {
  return '';
});

/// Провайдер страницы поиска
final searchProvider = StateNotifierProvider<SearchNotifier, FeedState>((ref) {
  return SearchNotifier(ref);
});

class SearchNotifier extends StateNotifier<FeedState> {
  SearchNotifier(this.ref) : super(FeedState()) {
    state = state.copyWith(posts: [], isLoading: false, isError: false);

    ref.listen(searchTextProvider, (previous, next) {
      loadPosts();
    });
  }

  Ref ref;

  /// Загрузить посты
  loadPosts() async {
    final searchText = ref.watch(searchTextProvider.notifier).state;

    if (searchText.isEmpty) {
      state = state.copyWith(posts: [], isLoading: false, isError: false);
      return;
    }

    state = state.copyWith(isLoading: true, isError: false);

    getPosts(searchText: searchText).then((posts) {
      state = state.copyWith(posts: posts, isLoading: false);
    }).catchError((error, stackTrace) {
      state = state.copyWith(posts: [], isLoading: false, isError: true);
    });
  }
}
