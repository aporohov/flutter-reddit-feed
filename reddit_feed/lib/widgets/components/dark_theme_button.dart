import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/providers/dark_theme_provider.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(darkThemeProvider);

    return IconButton(
        onPressed: () {
          _changeAppTheme(ref);
        },
        icon: Icon(isDarkTheme ? Icons.sunny : Icons.nightlight));
  }

  _changeAppTheme(WidgetRef ref) {
    ref.read(darkThemeProvider.notifier).state =
        !ref.read(darkThemeProvider.notifier).state;
  }
}
