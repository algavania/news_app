import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_model.freezed.dart';
part 'source_model.g.dart';

@freezed
class SourceModel with _$SourceModel {
  const factory SourceModel({
    String? id,
    required String name,
  }) = _SourceModel;

  factory SourceModel.fromJson(Map<String, Object?> json)
  => _$SourceModelFromJson(json);
}