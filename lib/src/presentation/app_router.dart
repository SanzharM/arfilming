import 'package:arfilming/src/presentation/screens/home/home_screen.dart';
import 'package:arfilming/src/presentation/screens/nav_bar_widget.dart';
import 'package:arfilming/src/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:arfilming/src/presentation/screens/profile/profile_screen.dart';
import 'package:arfilming/src/presentation/screens/settings/settings_screen.dart';
import 'package:arfilming/src/service_locator.dart';
import 'package:flutter/cupertino.dart';

extension XAppRouter on BuildContext {
  AppRouter get router {
    return sl<AppRouter>();
  }
}

class AppRouter {
  const AppRouter();

  // COMMON
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static CupertinoPageRoute routeBuilder(Widget widget) => CupertinoPageRoute(builder: (_) => widget);
  static final initialRoute = routes.entries.first.key;

  BuildContext get context {
    return navigatorKey.currentContext!;
  }

  NavigatorState get _navigator {
    return Navigator.of(context);
  }

  static final routes = <String, Widget Function(BuildContext context)>{
    _Routes.initial: (_) => const NavBarWidget(),
    _Routes.home: (_) => const HomeScreen(),
    _Routes.settings: (_) => const SettingsScreen(),
    _Routes.profile: (_) => const ProfileScreen(),
    _Routes.onboarding: (_) => const OnboardingScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings? settings) {
    return null;
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings? settings) {
    return null;
  }

  // BASICS
  void back() {
    if (_navigator.canPop()) {
      _navigator.pop<void>();
    }
  }

  Future<T?> push<T>(Widget widget) {
    return _navigator.push(CupertinoPageRoute(builder: (_) => widget));
  }

  void popUntil(bool Function(Route<dynamic> route) condition) {
    return _navigator.popUntil(condition);
  }

  // SHORTCUTS
  void toHome() => _navigator.pushNamed(_Routes.home);
  void toSettings() => _navigator.pushNamed(_Routes.settings);
  void toOnboarding() => _navigator.pushNamed(_Routes.onboarding);
}

class _Routes {
  static const String initial = '/';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String profile = '/profile';
  static const String onboarding = '/onboarding';
}
