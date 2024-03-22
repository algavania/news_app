
import 'package:news_app/features/home/bloc/news_bloc.dart';
import 'package:news_app/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;
    injector
      .registerFactory<NewsBloc>(
        () => NewsBloc(
          newsRepository: injector(),
        ),
      );
  }
}
