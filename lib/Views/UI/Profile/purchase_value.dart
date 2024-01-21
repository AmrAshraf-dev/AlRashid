import 'package:alrashid_mall_app/Views/UI/waiting_confirm_price.dart';
import 'package:alrashid_mall_app/api/controllers/purchase_value_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseValue extends StatelessWidget {
  PurchaseValue({Key? key}) : super(key: key);
  static final formGlobalKey = GlobalKey<FormState>();
  int? purchaseValueController;
  int? purchaseInvoiceController;
  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Form(
          key: formGlobalKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              ListTile(
                // leading: GestureDetector(
                //   onTap: () => Navigator.pop(context),
                //   child: const Icon(
                //     Icons.clear,
                //     size: 30.0,
                //     color: Color(0xff333333),
                //   ),
                // ),
                title: Center(
                  child: Text(
                    tr('Purchase value'),
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Image.asset('assets/images/bags.png', width: 65.0, height: 65.0),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  tr('Please enter the value of the purchases you have purchased'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff8d8d8d),
                    fontFamily: ('DINNextLTArabic'),
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: TextFormField(
                  //autofocus: false,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 15.0, color: Colors.black),
                  onChanged: (v) {
                    purchaseValueController = int.parse(v);
                  },
                  validator: (String? v) {
                    return v!.isEmpty ? tr('Cannot be empty') : null;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 18.0, bottom: 8.0, top: 12.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xfff2f2f2), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xfff2f2f2), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: tr('RS'),
                      hintStyle: const TextStyle(
                        fontFamily: ('DINNextLTArabic'),
                        color: Color(0xff8d8d8d),
                      )),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              //   child: TextFormField(
              //     //autofocus: false,
              //     keyboardType: TextInputType.number,
              //     style: const TextStyle(fontSize: 15.0, color: Colors.black),
              //     onChanged: (v) {
              //       purchaseInvoiceController = int.parse(v);
              //     },
              //     validator: (String? v) {
              //       return v!.isEmpty ? locale.cannotBeEmpty! : null;
              //     },
              //     decoration: InputDecoration(
              //         contentPadding: const EdgeInsets.only(
              //             left: 18.0, bottom: 8.0, top: 12.0),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: const BorderSide(
              //               color: Color(0xfff2f2f2), width: 2.0),
              //           borderRadius: BorderRadius.circular(15.0),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: const BorderSide(
              //               color: Color(0xfff2f2f2), width: 2.0),
              //           borderRadius: BorderRadius.circular(15.0),
              //         ),
              //         hintText: 'رقم الفاتورة',
              //         hintStyle: const TextStyle(
              //           fontFamily: ('DINNextLTArabic'),
              //           color: Color(0xff8d8d8d),
              //         )),
              //   ),
              // ),
              const SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                onTap: () async {
                  print("======>> ${GlobalState.instance.get("invoice")}");
                  if (formGlobalKey.currentState!.validate()) {
                    final bool purchaseValueNumber =
                        await PurchaseValueController.purchaseValueFunc(context,
                            amount: purchaseValueController ?? 0,
                            invoiceId:
                                int.parse(GlobalState.instance.get("invoice")));
                    if (purchaseValueNumber) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const WaitingConfirmPrice()),
                          (route) => false);
                    }
                  }
                  formGlobalKey.currentState!.save();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mywidth * 0.3),
                  child: Container(
                    height: 45,
                    child: Center(
                      child: Text(
                        tr('Continue'),
                        style: const TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
