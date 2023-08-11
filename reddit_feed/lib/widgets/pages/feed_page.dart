import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/providers/feed_provider.dart';

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
          title: const Text("Feed")),
      body: Consumer(
        builder: (context, ref, child) {
          final isLoading = ref.watch(feedProvider).isLoading;
          final isError = ref.watch(feedProvider).isError;
          final posts = ref.watch(feedProvider).posts;

          if (isLoading == true) {
            return Center(
              child: Text("Loading"),
            );
          } else if (isError == true) {
            return Center(
              child: Text("Error"),
            );
          }

          return RefreshIndicator(
              onRefresh: () => ref.read(feedProvider.notifier).loadPosts(),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Text(posts[index].title);
                },
              ));
        },
      ),
    );
  }
}
