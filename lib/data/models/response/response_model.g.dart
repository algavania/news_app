// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as String?,
      message: json['message'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: json['articles'],
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
