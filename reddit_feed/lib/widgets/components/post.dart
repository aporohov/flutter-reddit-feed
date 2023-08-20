// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post extends StatelessWidget {
  const Post(
      {super.key,
      required this.thumbnail,
      required this.title,
      required this.selftext,
      required this.thumbnail_width,
      required this.thumbnail_height,
      required this.ups,
      required this.downs,
      required this.num_comments});

  /// Превью URL
  final String thumbnail;

  /// Ширина превью
  final int? thumbnail_width;

  /// Высота превью
  final int? thumbnail_height;

  /// Кол-во плюсов у поста
  final int ups;

  /// Кол-во минусов у поста
  final int downs;

  /// Кол-во комментов
  final int? num_comments;

  /// Заголовок
  final String title;

  /// Описание
  final String selftext;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(4.0), child: _card(context));
  }

  Widget _card(BuildContext context) {
    List<Widget> cardContent = [];

    final photo = _photo();
    if (photo != null) {
      cardContent.addAll([photo, _whiteSpace()]);
    }

    cardContent = [
      ...cardContent,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [..._texts(), _badges()]),
      )
    ];

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        color: Theme.of(context).cardColor,
        child: Column(children: cardContent),
      ),
    );
  }

  Widget _whiteSpace({double height = 8.0}) {
    return SizedBox(
      height: height,
    );
  }

  Widget? _photo() {
    if (thumbnail_width == null || thumbnail_height == null) {
      return null;
    }

    if (!Uri.parse(thumbnail).isAbsolute) {
      return null;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final thumbnailAspectRatio = thumbnail_height! / thumbnail_width!;
        final imageHeight = constraints.maxWidth * thumbnailAspectRatio;

        return CachedNetworkImage(
          imageUrl: thumbnail,
          imageBuilder: (context, imageProvider) => Container(
            height: imageHeight,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => const Center(
              heightFactor: 4,
              child: CircularProgressIndicator(strokeWidth: 2)),
          errorWidget: (context, url, error) => const Center(
              heightFactor: 5,
              child: Icon(
                Icons.error,
                size: 50,
                weight: 3,
                color: Colors.deepOrangeAccent,
              )),
        );
      },
    );
  }

  List<Widget> _texts() {
    List<Widget> texts = [];

    if (title.isNotEmpty) {
      texts.addAll([
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        _whiteSpace(),
      ]);
    }

    if (selftext.isNotEmpty) {
      texts.addAll([
        Text(selftext,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
        _whiteSpace(height: 16),
      ]);
    }

    return texts;
  }

  Widget _badges() {
    return Row(
      children: [
        _PostBadge(iconData: Icons.arrow_upward, value: ups),
        const SizedBox(width: 16),
        _PostBadge(iconData: Icons.arrow_downward, value: downs),
        const SizedBox(width: 16),
        _PostBadge(
            iconData: CupertinoIcons.bubble_left, value: num_comments ?? 0)
      ],
    );
  }
}

class _PostBadge extends StatelessWidget {
  const _PostBadge({required this.iconData, required this.value});

  /// Иконка бейджа
  final IconData iconData;

  /// Значение
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 4),
        Text(
          NumberFormat.compact().format(value),
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
