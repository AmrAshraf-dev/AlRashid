part of 'verify_code_widgets_imports.dart';

class VerifyCodeButton extends StatelessWidget {
  final VerifyCodeData verifyCodeData;
  final String email;
  final StopWatchTimer stopWatchTimer;

  const VerifyCodeButton(
      {Key? key,
      required this.verifyCodeData,
      required this.email,
      required this.stopWatchTimer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
            borderRadius: 8,
            borderColor: MyColors.primary,
            title: tr("send"),
            onTap: () => verifyCodeData.resetPasswordByCode(context, email),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: verifyCodeData.btnKey,
            margin: const EdgeInsets.only(top: 40),
            fontSize: 14,
            height: 45),
        BlocBuilder<GenericBloc<String>, GenericState<String>>(
            bloc: verifyCodeData.timeCubit,
            builder: (context, state) {
                if(stopWatchTimer.isRunning){
                  return Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                    child: MyText(
                      title: "${tr("resendCodeAfter")}${state.data}${tr("s")}",
                      color: MyColors.black,
                      size: 13,
                      decoration: TextDecoration.underline,
                    ),
                  );
                }else{
                 return GestureDetector(
                    onTap: () {
                      verifyCodeData.resendCode(context, email);
                    },
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                      child: MyText(
                        title:tr("resendCode"),
                        color: MyColors.black,
                        size: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  );
                }
            })
      ],
    );
  }
}
