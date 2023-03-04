part of '../profile_screen.dart';

class _UnauthorizedProfile extends StatelessWidget {
  const _UnauthorizedProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppConstraints.padding),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton(
                title: L10n.of(context).login,
                onPressed: () {},
              ),
              SizedBox(height: AppConstraints.padding),
              AppButton(
                title: L10n.of(context).signup,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
