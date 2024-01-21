part of'product_value_widgets_imports.dart';
class BuildProductText extends StatelessWidget {
  const BuildProductText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: MyText(
        title: tr("customerEnteredValue"),
        color: MyColors.blackOpacity,
        size: 13,
        alien: TextAlign.center,
      ),
    );
  }
}
