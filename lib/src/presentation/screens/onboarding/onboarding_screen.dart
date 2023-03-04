import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:arfilming/src/core/l10n/l10n_service.dart';
import 'package:arfilming/src/core/services/utils.dart';
import 'package:arfilming/src/presentation/app_router.dart';
import 'package:arfilming/src/presentation/widgets/app_bars/custom_app_bar.dart';
import 'package:arfilming/src/presentation/widgets/buttons/app_button.dart';
import 'package:arfilming/src/presentation/widgets/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _onboardingController = PageController();

  final List<Widget> elements = [
    AppAssets.images.home.image(),
    AppAssets.images.home.image(),
    AppAssets.images.home.image(),
  ];

  @override
  void initState() {
    super.initState();
    _onboardingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _onboardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        needLeading: false,
        actions: [
          AppIconButton.close(context),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _onboardingController,
              itemCount: elements.length,
              itemBuilder: (context, index) {
                return elements.elementAt(index);
              },
            ),
          ),
          _IndicatorBuilder(
            totalCount: elements.length,
            controller: _onboardingController,
          ),
          SizedBox(height: 120.h),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(AppConstraints.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton(
              title: L10n.of(context).done,
              backgroundColor: theme.hintColor.withOpacity(0.4),
              textColor: theme.scaffoldBackgroundColor,
              onPressed: context.router.back,
            ),
            const SizedBox(height: 8.0),
            AppButton(
              title: L10n.of(context).next,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _IndicatorBuilder extends StatelessWidget {
  const _IndicatorBuilder({
    Key? key,
    required this.totalCount,
    required this.controller,
  }) : super(key: key);

  final int totalCount;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: SizedBox(
        height: AppConstraints.padding * 3 + 8.0,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(AppConstraints.padding),
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < totalCount; i++)
                GestureDetector(
                  onTap: () async {
                    return controller.animateToPage(
                      i,
                      duration: Utils.animationDuration,
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                    duration: Utils.animationDuration,
                    height: AppConstraints.padding,
                    width: AppConstraints.padding,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.page == i ? theme.highlightColor : theme.hintColor.withOpacity(0.2),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
