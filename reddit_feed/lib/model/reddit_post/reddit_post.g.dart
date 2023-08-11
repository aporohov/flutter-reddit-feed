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
      thumbnail_url: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$$_RedditPostToJson(_$_RedditPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'selftext': instance.selftext,
      'thumbnail_url': instance.thumbnail_url,
    };
