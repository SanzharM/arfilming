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

  static final routes = <String, Widget Function(BuildContext _)>{
    _Routes.initial: (_) => Container(),
    _Routes.home: (_) => Container(),
    _Routes.settings: (_) => Container(),
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
}

class _Routes {
  static String initial = '/';
  static String home = initial;
  static String settings = '/settings';
}
