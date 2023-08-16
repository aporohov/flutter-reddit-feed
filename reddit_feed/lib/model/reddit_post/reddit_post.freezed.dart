// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reddit_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RedditPost _$RedditPostFromJson(Map<String, dynamic> json) {
  return _RedditPost.fromJson(json);
}

/// @nodoc
mixin _$RedditPost {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get selftext => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  int? get thumbnail_width => throw _privateConstructorUsedError;
  int? get thumbnail_height => throw _privateConstructorUsedError;
  int get ups => throw _privateConstructorUsedError;
  int get downs => throw _privateConstructorUsedError;
  int? get num_comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RedditPostCopyWith<RedditPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedditPostCopyWith<$Res> {
  factory $RedditPostCopyWith(
          RedditPost value, $Res Function(RedditPost) then) =
      _$RedditPostCopyWithImpl<$Res, RedditPost>;
  @useResult
  $Res call(
      {String id,
      String title,
      String selftext,
      String thumbnail,
      int? thumbnail_width,
      int? thumbnail_height,
      int ups,
      int downs,
      int? num_comments});
}

/// @nodoc
class _$RedditPostCopyWithImpl<$Res, $Val extends RedditPost>
    implements $RedditPostCopyWith<$Res> {
  _$RedditPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? selftext = null,
    Object? thumbnail = null,
    Object? thumbnail_width = freezed,
    Object? thumbnail_height = freezed,
    Object? ups = null,
    Object? downs = null,
    Object? num_comments = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selftext: null == selftext
          ? _value.selftext
          : selftext // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail_width: freezed == thumbnail_width
          ? _value.thumbnail_width
          : thumbnail_width // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail_height: freezed == thumbnail_height
          ? _value.thumbnail_height
          : thumbnail_height // ignore: cast_nullable_to_non_nullable
              as int?,
      ups: null == ups
          ? _value.ups
          : ups // ignore: cast_nullable_to_non_nullable
              as int,
      downs: null == downs
          ? _value.downs
          : downs // ignore: cast_nullable_to_non_nullable
              as int,
      num_comments: freezed == num_comments
          ? _value.num_comments
          : num_comments // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RedditPostCopyWith<$Res>
    implements $RedditPostCopyWith<$Res> {
  factory _$$_RedditPostCopyWith(
          _$_RedditPost value, $Res Function(_$_RedditPost) then) =
      __$$_RedditPostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String selftext,
      String thumbnail,
      int? thumbnail_width,
      int? thumbnail_height,
      int ups,
      int downs,
      int? num_comments});
}

/// @nodoc
class __$$_RedditPostCopyWithImpl<$Res>
    extends _$RedditPostCopyWithImpl<$Res, _$_RedditPost>
    implements _$$_RedditPostCopyWith<$Res> {
  __$$_RedditPostCopyWithImpl(
      _$_RedditPost _value, $Res Function(_$_RedditPost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? selftext = null,
    Object? thumbnail = null,
    Object? thumbnail_width = freezed,
    Object? thumbnail_height = freezed,
    Object? ups = null,
    Object? downs = null,
    Object? num_comments = freezed,
  }) {
    return _then(_$_RedditPost(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selftext: null == selftext
          ? _value.selftext
          : selftext // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail_width: freezed == thumbnail_width
          ? _value.thumbnail_width
          : thumbnail_width // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail_height: freezed == thumbnail_height
          ? _value.thumbnail_height
          : thumbnail_height // ignore: cast_nullable_to_non_nullable
              as int?,
      ups: null == ups
          ? _value.ups
          : ups // ignore: cast_nullable_to_non_nullable
              as int,
      downs: null == downs
          ? _value.downs
          : downs // ignore: cast_nullable_to_non_nullable
              as int,
      num_comments: freezed == num_comments
          ? _value.num_comments
          : num_comments // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RedditPost implements _RedditPost {
  _$_RedditPost(
      {required this.id,
      required this.title,
      required this.selftext,
      required this.thumbnail,
      required this.thumbnail_width,
      required this.thumbnail_height,
      required this.ups,
      required this.downs,
      required this.num_comments});

  factory _$_RedditPost.fromJson(Map<String, dynamic> json) =>
      _$$_RedditPostFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String selftext;
  @override
  final String thumbnail;
  @override
  final int? thumbnail_width;
  @override
  final int? thumbnail_height;
  @override
  final int ups;
  @override
  final int downs;
  @override
  final int? num_comments;

  @override
  String toString() {
    return 'RedditPost(id: $id, title: $title, selftext: $selftext, thumbnail: $thumbnail, thumbnail_width: $thumbnail_width, thumbnail_height: $thumbnail_height, ups: $ups, downs: $downs, num_comments: $num_comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedditPost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.selftext, selftext) ||
                other.selftext == selftext) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.thumbnail_width, thumbnail_width) ||
                other.thumbnail_width == thumbnail_width) &&
            (identical(other.thumbnail_height, thumbnail_height) ||
                other.thumbnail_height == thumbnail_height) &&
            (identical(other.ups, ups) || other.ups == ups) &&
            (identical(other.downs, downs) || other.downs == downs) &&
            (identical(other.num_comments, num_comments) ||
                other.num_comments == num_comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, selftext, thumbnail,
      thumbnail_width, thumbnail_height, ups, downs, num_comments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedditPostCopyWith<_$_RedditPost> get copyWith =>
      __$$_RedditPostCopyWithImpl<_$_RedditPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RedditPostToJson(
      this,
    );
  }
}

abstract class _RedditPost implements RedditPost {
  factory _RedditPost(
      {required final String id,
      required final String title,
      required final String selftext,
      required final String thumbnail,
      required final int? thumbnail_width,
      required final int? thumbnail_height,
      required final int ups,
      required final int downs,
      required final int? num_comments}) = _$_RedditPost;

  factory _RedditPost.fromJson(Map<String, dynamic> json) =
      _$_RedditPost.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get selftext;
  @override
  String get thumbnail;
  @override
  int? get thumbnail_width;
  @override
  int? get thumbnail_height;
  @override
  int get ups;
  @override
  int get downs;
  @override
  int? get num_comments;
  @override
  @JsonKey(ignore: true)
  _$$_RedditPostCopyWith<_$_RedditPost> get copyWith =>
      throw _privateConstructorUsedError;
}
