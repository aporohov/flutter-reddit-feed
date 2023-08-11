import 'package:flutter/material.dart';
import 'package:reddit_feed/widgets/pages/feed_page.dart';
import 'package:reddit_feed/widgets/pages/search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Индекс выбранной страницы
  int currentPageIndex = 0;

  /// Виджеты для страниц
  final _pages = <Widget>[const FeedPage(), const SearchPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
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
