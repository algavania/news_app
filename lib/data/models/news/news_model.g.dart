// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      author: json['author'] as String? ?? 'Unknown',
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String? ??
          'https://www.gynprog.com.br/wp-content/uploads/2017/06/wood-blog-placeholder.jpg',
      content: json['content'] as String,
      publishedAt:
          const DateTimeConverter().fromJson(json['publishedAt'] as String),
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
      'publishedAt': const DateTimeConverter().toJson(instance.publishedAt),
    };
