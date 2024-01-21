part of'product_value_widgets_imports.dart';
class BuildProductText extends StatelessWidget {
  const BuildProductText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        "من فضلك ادخل قيمة المشتريات التي قمت بشرائها",
        style: TextStyle(fontSize: 13,color: Colors.black.withOpacity(.7)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
