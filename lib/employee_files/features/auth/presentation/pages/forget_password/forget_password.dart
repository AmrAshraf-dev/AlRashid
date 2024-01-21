part of 'forget_password_imports.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final ForgetPasswordData forgetPasswordData = ForgetPasswordData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAuthAppBar(haveLeading: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const BuildHeaderLogo(),
            BuildHeaderTitle(title: tr("forgetPassword")),
            BuildForgetForm(forgetPasswordData: forgetPasswordData),
            BuildForgetPasswordButton(forgetPasswordData: forgetPasswordData),
          ],
        ),
      ),
    );
  }
}
