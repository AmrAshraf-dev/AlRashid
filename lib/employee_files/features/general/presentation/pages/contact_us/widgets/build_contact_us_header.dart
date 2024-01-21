part of'contact_us_widgets_imports.dart';
class BuildContactUsHeader extends StatelessWidget {
  const BuildContactUsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MyText(title: "Get In Touch", color: MyColors.black, size: 16,fontWeight: FontWeight.bold,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 40),
            child: MyText(title: "Leave us a message,And we will Contact you as soon as possible", color: MyColors.black, size: 13,),
          )
        ],
      ),
    );
  }
}
