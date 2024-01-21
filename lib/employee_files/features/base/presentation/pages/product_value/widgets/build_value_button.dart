part of'product_value_widgets_imports.dart';
class BuildValueButton extends StatelessWidget {
  final ProductValueData productValueData;
  final ScanModel model;

  const BuildValueButton({Key? key, required this.productValueData, required this.model,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
            borderRadius: 30,
            title: tr("amountRight"),
            onTap: ()=>productValueData.confirmPrice(true, model.invoice!.id!,),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: productValueData.btnKey,
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 90),
            fontSize: 13,
            height: 45),
        InkWell(
          onTap: (){
            AutoRouter.of(context).push(const HomeRoute());
          },
          child: MyText(
            title: tr("amountNotRight"),
            color: MyColors.primary,
            size: 14,
            fontWeight: FontWeight.bold,
            alien: TextAlign.center,
          ),
        )
      ],
    );
  }
}
