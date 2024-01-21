part of 'select_user_imports.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  SelectUserData selectUserData = SelectUserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: BuildHeaderLogo()),
          MyText(
              title: tr("selectUser"),
              color: MyColors.black,
              size: 17),
          const SizedBox(
            height: 20
          ),
          Expanded(
              child: BuildSelectUserButtons(selectUserData: selectUserData))
        ],
      ),
    ));
  }
}
