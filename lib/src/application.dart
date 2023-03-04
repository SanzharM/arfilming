import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/l10n/generated/l10n.dart';
import 'package:arfilming/src/core/services/utils.dart';
import 'package:arfilming/src/domain/blocs/localization/localization_bloc.dart';
import 'package:arfilming/src/domain/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:arfilming/src/domain/blocs/nav_bar/nav_bar_bloc.dart';
import 'package:arfilming/src/domain/blocs/onboarding/onboarding_bloc.dart';
import 'package:arfilming/src/domain/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:arfilming/src/domain/blocs/theme/theme_bloc.dart';
import 'package:arfilming/src/domain/blocs/user/user_bloc.dart';
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
        BlocProvider<NavBarBloc>(
          create: (_) => NavBarBloc(),
        ),
        BlocProvider<OnboardingBloc>(
          lazy: false,
          create: (_) => OnboardingBloc()..initial(),
        ),
        BlocProvider<UserBloc>(
          lazy: false,
          create: (_) => UserBloc()..initial(),
        ),
        BlocProvider<PopularMoviesBloc>(
          create: (_) => PopularMoviesBloc()..fetch(),
        ),
        BlocProvider<MovieDetailBloc>(
          create: (_) => MovieDetailBloc(),
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
            final customTheme = state.theme;
            return BlocListener<OnboardingBloc, OnboardingState>(
              listener: (context, onboardingState) {
                if (onboardingState is OnboardingShowState) {
                  return context.router.toOnboarding();
                }
              },
              child: ScreenUtilInit(
                designSize: AppConstraints.designSize,
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) => MaterialApp(
                  title: Application.title,
                  debugShowCheckedModeBanner: false,

                  // THEME
                  theme: AppTheme.buildThemeData(customTheme: customTheme),
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
              ),
            );
          },
        );
      },
    );
  }
}
