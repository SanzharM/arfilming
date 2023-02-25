import 'package:arfilming/src/application.dart';
import 'package:arfilming/src/domain/blocs/bloc/movie_detail_bloc.dart';
import 'package:arfilming/src/presentation/widgets/app_bars/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              children: [
                TextButton(
                  onPressed: () => context.read<MovieDetailBloc>().fetch(5000),
                  child: Text('ASDASDAD'),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 1000.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
