import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/core/app_theme_data.dart';
import 'package:news_app/core/color_values.dart';
import 'package:news_app/injector/injector.dart';
import 'package:news_app/routes/router.dart';
import 'package:sizer/sizer.dart';

void main() async {
  Injector.init();
  await Injector.instance.allReady();
  runApp(const MyApp());
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) {
      return GlobalLoaderOverlay(
        useDefaultLoading: false,
        closeOnBackButton: true,
        overlayWidgetBuilder: (_) {
          return const Center(
              child: SpinKitChasingDots(
                color: ColorValues.primary50,
                size: 50.0,
              ));
        },
        child: MaterialApp.router(
          theme: AppThemeData.getTheme(context),
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
        ),
      );
    });
  }
}