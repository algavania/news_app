import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/core/color_values.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/data/models/news/news_model.dart';
import 'package:news_app/data/repositories/news/news.dart';
import 'package:news_app/features/home/bloc/news_bloc.dart';
import 'package:news_app/injector/injector.dart';
import 'package:news_app/routes/router.dart';
import 'package:news_app/utils/extensions/extensions.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = NewsBloc(newsRepository: Injector.instance<NewsRepository>());

  @override
  void initState() {
    _refreshPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: Stack(
          children: [
            ListView(
              physics: const AlwaysScrollableScrollPhysics(),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Styles.defaultPadding),
                child: Column(
                  children: [
                    _buildArticleWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshPage() async {
    _bloc.add(const NewsEvent.getArticlesEvent());
  }

  Widget _buildArticleWidget() {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: _bloc,
      builder: (context, state) {
        var list = <NewsModel>[];
        debugPrint(
            'testing state $state, ${state == const NewsState.loading()}');
        return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () {
              return _buildArticleList();
            },
            error: (error) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.showSnackBar(message: error, isSuccess: false);
              });

              return list.isNotEmpty
                  ? _buildArticleList(list: list)
                  : const SizedBox.shrink();
            },
            getArticlesLoaded: (data) {
              context.loaderOverlay.hide();
              list = data;
              return _buildArticleList(list: list);
            });
      },
    );
  }

  Widget _buildArticleList({List<NewsModel>? list}) {
    final newsDummy = NewsModel(
        author: 'author',
        title: 'title',
        description: 'description',
        url: 'https://www.google.com/',
        urlToImage:
            'https://www.gynprog.com.br/wp-content/uploads/2017/06/wood-blog-placeholder.jpg',
        content: 'Lorem Ipsum',
        publishedAt: DateTime.now());
    return Skeletonizer(
      enabled: list == null,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, i) => _buildArticleItem(list?[i] ?? newsDummy),
          separatorBuilder: (_, __) => const SizedBox(
                height: Styles.biggerSpacing,
              ),
          itemCount: list?.length ?? 5),
    );
  }

  Widget _buildArticleItem(NewsModel news) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
          border: Border.all(color: ColorValues.grey30)),
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(DetailRoute(news: news));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Styles.defaultBorder),
                  topRight: Radius.circular(Styles.defaultBorder)),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage,
                width: double.infinity,
                height: 25.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Styles.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: Styles.biggerSpacing,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          news.author,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: Styles.defaultSpacing,),
                      Text(
                        DateFormat('dd MMM yyyy').format(news.publishedAt),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ColorValues.grey50),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
