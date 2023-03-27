import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'core/blocobserver/bloc_observer.dart';
import 'core/dependencyInjection/di.dart';
import 'core/routes/router.gr.dart';
import 'core/theme/apptheme.dart';

void main() async {
  EquatableConfig.stringify = true;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await AppContainer.init();
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: GetIt.I<AppBlocObserver>());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      title: 'Flutter Demo',
      routerDelegate: AutoRouterDelegate(_appRouter,
          initialRoutes: [const HomePageRoute()]),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1920,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScaleDown(1500, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
