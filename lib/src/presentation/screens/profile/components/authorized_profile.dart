part of '../profile_screen.dart';

class _AuthorizedProfile extends StatelessWidget {
  const _AuthorizedProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColors.black,
          height: 200.w,
          width: 200.w,
        ),
      ],
    );
  }
}
