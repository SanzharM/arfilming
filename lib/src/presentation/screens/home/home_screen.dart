import 'package:arfilming/src/application.dart';
import 'package:arfilming/src/presentation/screens/home/components/popular_movies_widget.dart';
import 'package:arfilming/src/presentation/widgets/app_bars/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(
            title: Application.title,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                PopularMoviesWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
