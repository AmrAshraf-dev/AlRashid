part of'my_profile_widgets_import.dart';
class BuildShareModal extends StatelessWidget {
  const BuildShareModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: MyText(title: tr("shareAppVia"), color: MyColors.black, size: 14,fontWeight: FontWeight.bold,alien: TextAlign.center,),
        content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildShareItem(image: Res.facebook,title: tr("facebook"),),
              BuildShareItem(image: Res.twitter,title: tr("twitter"),),
              BuildShareItem(image: Res.insta,title: tr("instagram"),),
              BuildShareItem(image: Res.whatsapp,title: tr("whatsapp"),)
            ]
          ),
        ),
      ),
    );
  }
}
