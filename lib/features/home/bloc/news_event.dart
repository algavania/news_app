part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.started() = _Started;
  const factory NewsEvent.getArticlesEvent() = _GetArticlesEvent;
}
