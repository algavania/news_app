
import 'package:news_app/data/repositories/repositories.dart';
import 'package:news_app/injector/injector.dart';

class RepositoryModule {
  RepositoryModule._();
  static void init() {
    final injector = Injector.instance;

    injector
      .registerFactory<NewsRepository>(
        () => NewsRepositoryImpl(),
      );
  }
}
