import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/widgets/pages/feed_page.dart';
import 'package:reddit_feed/widgets/pages/search_page.dart';

/// Провайдер выбранной страницы
final homeNavigationProvider = StateProvider<int>((ref) => 0);

/// Виджет для HomePage
class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  /// Виджеты страниц Навигейшен бара
  final _pages = <Widget>[const FeedPage(), const SearchPage()];

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = ref.watch(homeNavigationProvider);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          ref.read(homeNavigationProvider.notifier).state = index;
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.feed_outlined),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          )
        ],
      ),
      body: IndexedStack(index: currentPageIndex, children: _pages),
    );
  }
}
