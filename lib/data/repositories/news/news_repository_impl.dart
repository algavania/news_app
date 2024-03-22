import 'package:news_app/core/network_constants.dart';
import 'package:news_app/data/models/response/response_model.dart';
import 'package:news_app/network/network_helper.dart';

import 'news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  @override
  Future<ResponseModel> getAllArticles() async {
    NetworkHelper networkHelper = NetworkHelper();
    const url = '${NetworkConstants.baseUrl}/everything?q=Indonesia&apiKey=${NetworkConstants.apiKey}';
    return await networkHelper.get(Uri.parse(url));
  }
}