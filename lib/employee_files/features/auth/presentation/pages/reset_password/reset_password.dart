part of 'reset_password_imports.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  final String code;

  const ResetPassword({Key? key, required this.email, required this.code})
      : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final ResetPasswordData resetPasswordData = ResetPasswordData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAuthAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const BuildHeaderLogo(),
            BuildHeaderTitle(title: tr("insertNewPass")),
            ResetPasswordForm(resetPasswordData: resetPasswordData),
            ResetPasswordButton(resetPasswordData: resetPasswordData, code:widget.code,email: widget.email,),
          ],
        ),
      ),
    );
  }
}
