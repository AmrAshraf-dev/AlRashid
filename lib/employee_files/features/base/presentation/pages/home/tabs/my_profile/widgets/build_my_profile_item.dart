part of 'my_profile_widgets_import.dart';

class BuildMyProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? page;
  final bool? isOpenContainer;
  final Function()? onTap;

  const BuildMyProfileItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.onTap,
      this.isOpenContainer = true, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOpenContainer==true?OpenContainer(
      closedElevation: 0,
      closedShape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      transitionDuration: const Duration(milliseconds: 500),
      openBuilder: (_, closeContainer) => page ?? Container(),
      closedBuilder: (_, openContainer) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: MyColors.primary,
            ),
            const SizedBox(
              width: 20,
            ),
            MyText(title: title, color: MyColors.black, size: 13),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: MyColors.black,
            ),
          ],
        ),
      ),
    ):InkWell(
      onTap: onTap??(){},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: MyColors.primary,
            ),
            const SizedBox(
              width: 20,
            ),
            MyText(title: title, color: MyColors.black, size: 13),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: MyColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
