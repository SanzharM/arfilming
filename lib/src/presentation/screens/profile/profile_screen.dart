import 'package:arfilming/src/core/constants/app_constraints.dart';
import 'package:arfilming/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:arfilming/src/core/l10n/l10n_service.dart';
import 'package:arfilming/src/core/services/utils.dart';
import 'package:arfilming/src/domain/blocs/user/user_bloc.dart';
import 'package:arfilming/src/presentation/widgets/app_bars/custom_sliver_app_bar.dart';
import 'package:arfilming/src/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'components/authorized_profile.dart';
part 'components/unauthorized_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                title: L10n.of(context).profile,
              ),
              SliverToBoxAdapter(
                child: AnimatedSwitcher(
                  duration: Utils.animationDuration,
                  child: state.isAuthorized ? const _AuthorizedProfile() : const _UnauthorizedProfile(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
