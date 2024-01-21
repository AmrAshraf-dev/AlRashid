part of'pill_widgets_imports.dart';
class BuildPillAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildPillAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: MyText(title: tr("bill"), color: MyColors.black, size: 15),
      // actions: [
      //   IconButton(
      //       onPressed: () => AutoRouter.of(context).push(HomeRoute()),
      //       icon: Icon(
      //         Icons.close,
      //         color: MyColors.black,
      //       ))
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
