import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/home/desktop/desktop_home.dart';
import '../../features/home/home.dart';
import '../../features/home/mobile/mobile_home.dart';
import '../../features/splashScreen/splash_screen.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen', routes: [
  AutoRoute(path: '', page: SplashScreen, initial: true),
  AutoRoute(path: '', page: HomePage),
  AutoRoute(path: '', page: DesktopHome),
  AutoRoute(path: '', page: MobileHome),
])
class $AppRouter {}
