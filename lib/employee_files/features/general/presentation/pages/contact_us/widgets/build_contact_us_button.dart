part of 'contact_us_widgets_imports.dart';

class BuildContactUsButton extends StatelessWidget {
  final ContactUsData contactUsData;

  const BuildContactUsButton(
      {Key? key, required this.contactUsData, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var setting = context.read<SettingCubit>().state.model;

    return Column(
      children: [
        LoadingButton(
        borderRadius: 8,
        borderColor: MyColors.primary,
        title: tr("send"),
        onTap: () =>contactUsData.sendMessage(context),
        color: MyColors.primary,
        textColor: MyColors.white,
        btnKey: contactUsData.btnKey,
        margin: const EdgeInsets.symmetric(vertical: 30),
        fontSize: 13,
        height: 45
    ),
        const SizedBox(
          height: 30,
        ),
        MyText(title: tr("orContactVia"), color: MyColors.black, size: 13),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => getIt<Utilities>().launchURL(url: setting?.facebook ?? ""),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Image.asset(Res.facebook,height:30,width:30)
              ),
            ),
            InkWell(
              onTap: () => getIt<Utilities>().launchURL(url: setting?.instagram ?? ""),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Image.asset(Res.insta,height: 30,width: 30)
              ),
            ),
            InkWell(
              onTap: () => getIt<Utilities>().launchWhatsApp(context,setting?.whatsapp ?? ""),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Image.asset(Res.whatsapp,height: 30,width: 30)
              ),
            ),
          ],
        )
      ],
    );
  }
}
