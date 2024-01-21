part of'my_profile_widgets_import.dart';
class BuildShareItem extends StatelessWidget {
  final String image;
  final String title;
  const BuildShareItem({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image,height: 30,width: 30,),
          const SizedBox(height: 10,),
          MyText(title:title , color: MyColors.black, size: 10)
        ],
      ),
    );
  }
}
