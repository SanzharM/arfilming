import 'package:arfilming/src/core/l10n/generated/l10n.dart';
import 'package:arfilming/src/presentation/app_router.dart';
import 'package:arfilming/src/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  static const title = 'Arfilming';

  @override
  Widget build(BuildContext context) {
    return const _Application();
  }
}

class _Application extends StatelessWidget {
  const _Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Application.title,
      debugShowCheckedModeBanner: false,
      // THEME
      theme: AppTheme.defaultTheme(),

      // ROUTING
      navigatorKey: AppRouter.navigatorKey,
      routes: AppRouter.routes,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
      home: null,

      // LOCALIZATION
      locale: Locale('en', 'US'),
      localizationsDelegates: const <LocalizationsDelegate>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
