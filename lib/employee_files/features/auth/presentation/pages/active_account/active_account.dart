part of 'active_account_imports.dart';

class ActiveAccount extends StatefulWidget {
  final String email;
  final String code;
  const ActiveAccount({Key? key, required this.email, required this.code})
      : super(key: key);

  @override
  _ActiveAccountState createState() => _ActiveAccountState();
}

class _ActiveAccountState extends State<ActiveAccount> {
  final ActiveAccountController controller = ActiveAccountController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: const BuildAuthAppBar(
        haveLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          BuildHeaderTitle(
            title: tr("enterCode"),
          ),
          BuildPinField(
            onComplete: controller.onComplete,
          ),
          BuildActiveButton(controller: controller),
        ],
      ),
    );
  }
}
