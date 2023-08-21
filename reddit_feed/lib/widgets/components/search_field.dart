import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/providers/search_provider.dart';

/// Виджет текстового поля поиска
class SearchField extends ConsumerStatefulWidget {
  const SearchField({super.key});

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  /// Контроллер строки поиска
  final _controller = TextEditingController();

  /// Задержка для событий строки поиска
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchText = ref.watch(searchTextProvider);

    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          hintText: 'Поиск',
          hintStyle:
              TextStyle(color: Theme.of(context).colorScheme.onBackground),
          suffixIcon: searchText.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.text = '';
                    ref.read(searchTextProvider.notifier).state = '';
                  },
                )),
      onChanged: _onSearchChanged,
    );
  }

  _onSearchChanged(String searchText) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchTextProvider.notifier).state = searchText;
    });
  }
}
