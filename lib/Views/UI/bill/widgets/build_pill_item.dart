part of'pill_widgets_imports.dart';
class BuildPillItem extends StatelessWidget {
  final String title;
  final String value;
  final Color? titleColor;
  final Color? valueColor;

  const BuildPillItem({Key? key, required this.title, required this.value, this.titleColor, this.valueColor, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Text(title,style: TextStyle(color: titleColor??Colors.grey,fontSize: 14,fontFamily: ('DINNextLTArabic'),),),
          Text(value,style: TextStyle(color: valueColor??Colors.grey,fontSize: 14,fontFamily: ('DINNextLTArabic'),),)

        ],
      ),
    );
  }
}
