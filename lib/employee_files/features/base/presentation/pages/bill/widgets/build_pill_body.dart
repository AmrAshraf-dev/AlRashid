part of 'pill_widgets_imports.dart';

class BuildPillBody extends StatelessWidget {
  final ScanModel model;
  final BillData pillData;

  const BuildPillBody({Key? key, required this.pillData, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var place = context.read<UserCubit>().state.model!.token!.place;
    var dates = DateTime.parse(model.invoice?.created_at ?? "");
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height * .65,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(Res.bill))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildPillItem(
                    title: tr("date"),
                    value: DateFormat('MM/dd/yyyy').format(dates)),
                BuildPillItem(
                    title: tr("time"),
                    value: DateFormat('HH:mm').format(dates)),
                BuildPillItem(
                    title: tr("employeeName"), value: model.user?.name ?? ""),
                const Divider(indent: 70, endIndent: 70),
                BuildPillItem(
                    title: tr("priceBeforeDis"),
                    value:
                        "${model.invoice?.amount_before_discount ?? ""} ${tr("sar")}"),
                BuildPillItem(
                    title: tr("couponDis"),
                    value: "${model.invoice?.code_price ?? ""} ${tr("sar")}"),
                const Divider(indent: 70, endIndent: 70),
                BuildPillItem(
                    title: tr("placeName"),
                    value: (lang == "ar"?place?.name_ar:place?.name_en)??"",
                    titleColor: MyColors.black,
                    valueColor: Colors.red),
              ],
            ),
          ),
        ),
        Positioned(
            top: 60,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade300, width: 8),
                  color: Colors.green,
                  shape: BoxShape.circle),
              child: const Icon(Icons.check, color: MyColors.white, size: 45),
            )),
        Positioned(
            bottom: 30,
            right: 30,
            left: 30,
            child: LoadingButton(
                borderRadius: 30,
                borderColor: MyColors.primary,
                title: tr("shareInvoicePic"),
                onTap: () async {
                  await pillData.onChoosePhoto(context, model.invoice!.id!);
                },
                color: MyColors.white,
                textColor: MyColors.primary,
                btnKey: pillData.btnKey,
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                fontSize: 13,
                height: 45))
      ],
    );
  }
}
