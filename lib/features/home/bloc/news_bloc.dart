import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/data/models/news/news_model.dart';
import 'package:news_app/data/models/response/response_model.dart';
import 'package:news_app/data/repositories/news/news.dart';
import 'package:news_app/logger.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({
    required NewsRepository newsRepository,
  }) : super(const NewsState.initial()) {
    _repository = newsRepository;
    on<_GetArticlesEvent>(_getArticles);
  }

  late final NewsRepository _repository;

  Future<void> _getArticles(_GetArticlesEvent event, Emitter<NewsState> emit) async {
    emit(const _Loading());
    try {
      ResponseModel res = await _repository.getAllArticles();
      final list = <NewsModel>[];
      if (res.articles != null) {
        for (final data in res.articles) {
          final news = NewsModel.fromJson(data as Map<String, dynamic>);
          list.add(news);
        }
      }
      emit(NewsState.getArticlesLoaded(articles: list));
    } catch (e, stacktrace) {
      logger.e(e.toString(), stackTrace: stacktrace);
      emit(NewsState.error(message: e.toString()));
    }
  }
}
