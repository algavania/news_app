import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/models/response/response_model.dart';
import 'package:news_app/logger.dart';

class NetworkHelper {
  Future<ResponseModel> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final res = await http.get(url, headers: headers);
    ResponseModel responseModel = ResponseModel.fromJson(jsonDecode(res.body));
    logger.i('response ${responseModel.toJson()} ${responseModel.status}');
    if (responseModel.status != 'ok') throw responseModel.message ?? 'Error';
    return responseModel;
  }
}
