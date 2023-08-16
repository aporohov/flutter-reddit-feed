import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmptyScreenType { error, empty }

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.action, required this.type});

  /// Тип экрана-заглушки
  final EmptyScreenType type;

  /// Обработчик события кнопки
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _image(context),
        const SizedBox(height: 20),
        Text(_title(),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 21)),
        const SizedBox(height: 150),
        FilledButton(onPressed: action, child: const Text("Перезагрузить"))
      ]),
    );
  }

  String _title() {
    switch (type) {
      case EmptyScreenType.empty:
        return "Ничего не найдено";
      case EmptyScreenType.error:
        return "Что-то пошло не так";
    }
  }

  Widget _image(BuildContext context) {
    switch (type) {
      case EmptyScreenType.empty:
        return Icon(CupertinoIcons.search,
            size: 50, color: Theme.of(context).primaryColor);
      case EmptyScreenType.error:
        return const Icon(Icons.error,
            size: 50, color: Colors.deepOrangeAccent);
    }
  }
}
