import 'package:arfilming/src/core/l10n/l10n_service.dart';
import 'package:arfilming/src/presentation/widgets/app_bars/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            title: L10n.of(context).profile,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Container(
                //   height: 400,
                //   width: double.maxFinite,
                //   color: Colors.amber,
                // ),
                Container(
                  height: 800,
                  width: double.maxFinite,
                  color: Colors.cyan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
