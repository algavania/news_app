part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.error({required String message}) = _Error;
  const factory NewsState.getArticlesLoaded({required List<NewsModel> articles}) = _GetArticlesLoaded;
}
