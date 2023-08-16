// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RedditPost _$$_RedditPostFromJson(Map<String, dynamic> json) =>
    _$_RedditPost(
      id: json['id'] as String,
      title: json['title'] as String,
      selftext: json['selftext'] as String,
      thumbnail: json['thumbnail'] as String,
      thumbnail_width: json['thumbnail_width'] as int?,
      thumbnail_height: json['thumbnail_height'] as int?,
      ups: json['ups'] as int,
      downs: json['downs'] as int,
      num_comments: json['num_comments'] as int?,
    );

Map<String, dynamic> _$$_RedditPostToJson(_$_RedditPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'selftext': instance.selftext,
      'thumbnail': instance.thumbnail,
      'thumbnail_width': instance.thumbnail_width,
      'thumbnail_height': instance.thumbnail_height,
      'ups': instance.ups,
      'downs': instance.downs,
      'num_comments': instance.num_comments,
    };
