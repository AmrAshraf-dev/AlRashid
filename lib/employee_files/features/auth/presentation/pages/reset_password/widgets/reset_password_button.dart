part of'reset_password_widgets_imports.dart';

class ResetPasswordButton extends StatelessWidget {
  final String email;
  final String code;
  final ResetPasswordData resetPasswordData;
  const ResetPasswordButton({Key? key,required this.resetPasswordData, required this.email, required this.code,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  LoadingButton(
        borderRadius: 8,
        borderColor: MyColors.primary,
        title: tr("confirm"),
        onTap: ()=>resetPasswordData.resetPasswordByCode(context, email, code),
        color: MyColors.primary,
        textColor: MyColors.white,
        btnKey: resetPasswordData.btnKey,
        margin: const EdgeInsets.only(top: 40),
        fontSize: 14,
        height: 45
    );
  }
}
