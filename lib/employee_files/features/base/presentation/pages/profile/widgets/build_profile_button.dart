part of 'profile_widgets_imports.dart';

class BuildProfileButton extends StatelessWidget {
  final ProfileController profileController;

  const BuildProfileButton({Key? key, required this.profileController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
        borderRadius: 8,
        borderColor: MyColors.primary,
        title: tr("confirm"),
        onTap: () =>profileController.updateProfile(context),
        color: MyColors.primary,
        textColor: MyColors.white,
        btnKey: profileController.btnKey,
        margin: const EdgeInsets.symmetric(vertical: 40),
        fontSize: 13,
        height: 45);
  }
}
