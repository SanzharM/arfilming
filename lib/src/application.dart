import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/l10n/generated/l10n.dart';
import 'package:arfilming/src/core/services/utils.dart';
import 'package:arfilming/src/domain/blocs/bloc/theme_bloc.dart';
import 'package:arfilming/src/domain/blocs/localization/localization_bloc.dart';
import 'package:arfilming/src/presentation/app_router.dart';
import 'package:arfilming/src/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  static const title = 'Arfilming';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationBloc>(
          lazy: false,
          create: (_) => LocalizationBloc()..initial(),
        ),
        BlocProvider<ThemeBloc>(
          lazy: false,
          create: (_) => ThemeBloc()..initial(),
        ),
      ],
      child: const _Application(),
    );
  }
}

class _Application extends StatelessWidget {
  const _Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        final locale = state.locale;
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: AppConstraints.designSize,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) => MaterialApp(
                title: Application.title,
                debugShowCheckedModeBanner: false,

                // THEME
                theme: AppTheme.buildThemeData(customTheme: state.theme),
                themeAnimationCurve: Curves.easeInOut,
                themeAnimationDuration: Utils.delayDuration,
                themeMode: state.theme.themeMode,

                // ROUTING
                navigatorKey: AppRouter.navigatorKey,
                routes: AppRouter.routes,
                initialRoute: AppRouter.initialRoute,
                onGenerateRoute: AppRouter.onGenerateRoute,
                onUnknownRoute: AppRouter.onUnknownRoute,
                home: null,

                // LOCALIZATION
                locale: locale,
                localizationsDelegates: const <LocalizationsDelegate>[
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  S.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
              ),
            );
          },
        );
      },
    );
  }
}
