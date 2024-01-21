part of 'pill_widgets_imports.dart';

class BuildPillBody extends StatelessWidget {
  final BillData pillData;

  const BuildPillBody({Key? key, required this.pillData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScanModel model =
        ScanModel.fromJson(json.decode(GlobalState.instance.get('bill')));
    print("======================>>$model");
    var dates = DateTime.parse(model.invoice?.createdAt ?? "");

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
                image: DecorationImage(
                    image: AssetImage("assets/images/bill.png"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildPillItem(
                    title: "التاريخ",
                    value: DateFormat('MM/dd/yyyy').format(dates)),
                BuildPillItem(
                    title: "الوقت",
                    value: DateFormat('hh:mm ').format(dates)),
                BuildPillItem(title: "الموظف", value:model.invoice?.employer?.name??""),
                const Divider(indent: 70, endIndent: 70),
                BuildPillItem(
                    title: "المبلغ الكلي ",
                    value: model.invoice!.amountBeforeDiscount.toString()),
                BuildPillItem(
                    title: "خصم الكوبون",
                    value: model.invoice!.codePrice.toString()),
                const Divider(indent: 70, endIndent: 70),
                BuildPillItem(
                    title: "المتجر",
                    value: model.invoice!.place!.nameAr.toString(),
                    titleColor: Colors.black,
                    valueColor: Colors.red),
              ],
            ),
          ),
        ),
        Positioned(
            top: 90,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade300, width: 8),
                  color: Colors.green,
                  shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Colors.white, size: 45),
            )),

        Positioned(
          bottom: 30,
          right: 30,
          left: 30,
          child: InkWell(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (c) => // const
                        MyBottomNavyBar(
                          commingFromSplash: true,
                        )),
                (route) => false),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 40,
              child: const Center(
                child: Text(
                  "العودة للرئيسية",
                  style: TextStyle(
                    color: Color(0xffb83f48),
                    fontFamily: ('DINNextLTArabic'),
                    fontSize: 18.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffb83f48),
                ),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),
        // Positioned(
        //
        //     child: LoadingButton(
        //         borderRadius: 30,
        //         borderColor: MyColors.primary,
        //         title: tr("shareInvoicePic"),
        //         onTap: () async {
        //           var res = await getIt<Utilities>().getCameraImage();
        //           if (res != null) {
        //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //                 backgroundColor: Colors.green,
        //                 content: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     MyText(
        //                         title: tr("operationCompleted"),
        //                         color: MyColors.white,
        //                         size: 13),
        //                     Icon(Icons.close, color: MyColors.white)
        //                   ],
        //                 )));
        //             Future.delayed(Duration(milliseconds: 5000), () {
        //               AutoRouter.of(context).push(HomeRoute());
        //             });
        //           }
        //         },
        //         color: MyColors.white,
        //         textColor: MyColors.primary,
        //         btnKey: pillData.btnKey,
        //         margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        //         fontSize: 13,
        //         height: 45))
      ],
    );
  }
}
