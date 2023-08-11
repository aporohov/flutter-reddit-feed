import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/providers/search_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  /// Задержка для событий строки поиска
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextFormField(
          decoration: InputDecoration(
              hintText: 'Поиск',
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          onChanged: _onSearchChanged,
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final isLoading = ref.watch(searchProvider).isLoading;
          final isError = ref.watch(searchProvider).isError;
          final posts = ref.watch(searchProvider).posts;
          final searchText = ref.watch(searchTextProvider.notifier).state;

          if (isLoading == true) {
            return Center(
              child: Text("Loading"),
            );
          } else if (isError == true) {
            return Center(
              child: Text("Error"),
            );
          } else if (searchText.isEmpty) {
            return Center(
              child: Text("Начните поиск"),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Text(posts[index].title);
            },
          );
        },
      ),
    );
  }

  _onSearchChanged(String searchText) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchTextProvider.notifier).state = searchText;
    });
  }
}
