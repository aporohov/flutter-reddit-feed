import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/providers/search_provider.dart';
import 'package:reddit_feed/widgets/components/empty_screen.dart';
import 'package:reddit_feed/widgets/components/loading_indicator.dart';
import 'package:reddit_feed/widgets/components/post.dart';
import 'package:reddit_feed/widgets/components/search_field.dart';

/// Виджет страницы поиска
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const SearchField(),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final isLoading = ref.watch(searchProvider).isLoading;
          final isError = ref.watch(searchProvider).isError;
          final posts = ref.watch(searchProvider).posts;
          final searchText = ref.watch(searchTextProvider.notifier).state;

          if (isLoading == true) {
            return const Center(
              child: LoadingIndicator(),
            );
          } else if (isError == true) {
            return EmptyScreen(
              type: EmptyScreenType.error,
              action: () {
                ref.read(searchProvider.notifier).loadPosts();
              },
            );
          } else if (searchText.isEmpty) {
            return const Center(
              child: Text("Начните поиск",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21)),
            );
          } else if (posts.isEmpty) {
            return EmptyScreen(
              type: EmptyScreenType.empty,
              action: () {
                ref.read(searchProvider.notifier).loadPosts();
              },
            );
          }

          return Container(
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
          );
        },
      ),
    );
  }
}
