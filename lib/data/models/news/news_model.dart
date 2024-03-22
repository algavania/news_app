import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/data/models/date_time_converter.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    @Default('Unknown') String author,
    required String title,
    required String description,
    required String url,
    @Default('https://www.gynprog.com.br/wp-content/uploads/2017/06/wood-blog-placeholder.jpg') String urlToImage,
    required String content,
    @DateTimeConverter() required DateTime publishedAt,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, Object?> json)
  => _$NewsModelFromJson(json);
}