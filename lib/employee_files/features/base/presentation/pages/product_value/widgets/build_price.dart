part of'product_value_widgets_imports.dart';
class BuildPrice extends StatefulWidget {
  final String price;
  const BuildPrice({Key? key, required this.price}) : super(key: key);

  @override
  State<BuildPrice> createState() => _BuildPriceState();
}

class _BuildPriceState extends State<BuildPrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.offWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            title: widget.price,
            color: MyColors.black,
            size: 12,
          ),
          MyText(
            title: tr("sar"),
            color: MyColors.black,
            size: 12,
          ),
        ],
      ),
    );
  }
}
