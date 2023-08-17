import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/providers/dark_theme_provider.dart';
import 'package:reddit_feed/widgets/pages/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(darkThemeProvider);

    final themeLight = ThemeData(
      brightness: Brightness.light,
      canvasColor: Colors.grey[300],
      useMaterial3: true,
    );

    final themeDark = ThemeData(
      brightness: Brightness.dark,
      canvasColor: Colors.black,
      cardColor: Colors.grey[800],
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}
