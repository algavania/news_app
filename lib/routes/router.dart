import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/news/news_model.dart';
import 'package:news_app/features/pages.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: HomeRoute.page,
      path: '/',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true
    ),
    CustomRoute(
        page: DetailRoute.page,
        path: '/detail',
        transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
