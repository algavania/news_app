import 'package:news_app/data/models/response/response_model.dart';

abstract class NewsRepository {
  Future<ResponseModel> getAllArticles();
}