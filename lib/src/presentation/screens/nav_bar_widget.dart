import 'package:arfilming/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:arfilming/src/core/services/utils.dart';
import 'package:arfilming/src/domain/blocs/nav_bar/nav_bar_bloc.dart';
import 'package:arfilming/src/presentation/screens/home/home_screen.dart';
import 'package:arfilming/src/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  final List<Widget> items = const <Widget>[
    HomeScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final colorFilter = ColorFilter.mode(
      theme.hintColor.withOpacity(0.7),
      BlendMode.srcIn,
    );
    final activeColorFilter = ColorFilter.mode(
      theme.colorScheme.primary,
      BlendMode.srcIn,
    );

    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        Widget getChild() {
          return items.elementAt(state.currentIndex);
        }

        return Scaffold(
          body: AnimatedSwitcher(
            duration: Utils.animationDuration,
            child: getChild(),
          ),
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: state.currentIndex,
            onTap: context.read<NavBarBloc>().changeIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: AppAssets.icons.home.svg(
                  colorFilter: colorFilter,
                ),
                activeIcon: AppAssets.icons.home.svg(
                  colorFilter: activeColorFilter,
                ),
              ),
              BottomNavigationBarItem(
                icon: AppAssets.icons.squares.svg(
                  colorFilter: colorFilter,
                ),
                activeIcon: AppAssets.icons.squares.svg(
                  colorFilter: activeColorFilter,
                ),
              ),
              BottomNavigationBarItem(
                icon: AppAssets.icons.profile.svg(
                  colorFilter: colorFilter,
                ),
                activeIcon: AppAssets.icons.profile.svg(
                  colorFilter: activeColorFilter,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
