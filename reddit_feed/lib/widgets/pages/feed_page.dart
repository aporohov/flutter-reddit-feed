import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/providers/feed_provider.dart';
import 'package:reddit_feed/widgets/components/empty_screen.dart';
import 'package:reddit_feed/widgets/components/loading_indicator.dart';
import 'package:reddit_feed/widgets/components/post.dart';
import 'package:reddit_feed/widgets/components/dark_theme_button.dart';

/// Виджет страницы новостей
class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Feed"),
        actions: const [ThemeButton()],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final isLoading = ref.watch(feedProvider).isLoading;
          final isError = ref.watch(feedProvider).isError;
          final posts = ref.watch(feedProvider).posts;

          if (isLoading == true) {
            return const Center(
              child: LoadingIndicator(),
            );
          } else if (isError == true) {
            return EmptyScreen(
              type: EmptyScreenType.error,
              action: () {
                ref.read(feedProvider.notifier).loadPosts();
              },
            );
          } else if (posts.isEmpty) {
            return EmptyScreen(
              type: EmptyScreenType.empty,
              action: () {
                ref.read(feedProvider.notifier).loadPosts();
              },
            );
          }

          return RefreshIndicator(
              onRefresh: () => ref.read(feedProvider.notifier).loadPosts(),
              child: Container(
                color: Theme.of(context).canvasColor,
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Post(
                        thumbnail: post.thumbnail,
                        title: post.title,
                        selftext: post.selftext,
                        thumbnail_width: post.thumbnail_width,
                        thumbnail_height: post.thumbnail_height,
                        ups: post.ups,
                        downs: post.downs,
                        num_comments: post.num_comments);
                  },
                ),
              ));
        },
      ),
    );
  }
}
