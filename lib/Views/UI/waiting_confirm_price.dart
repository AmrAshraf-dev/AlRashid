import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter/material.dart';

import 'BottomNavyBar.dart';

class WaitingConfirmPrice extends StatefulWidget {
  const WaitingConfirmPrice({Key? key}) : super(key: key);

  @override
  State<WaitingConfirmPrice> createState() => _WaitingConfirmPriceState();
}

class _WaitingConfirmPriceState extends State<WaitingConfirmPrice> {

  @override
  void initState() {
    GlobalState.instance.set("context",context);
    // GlobalNotification().notificationSubject.stream.listen((event) {
    //   if (mounted) {
    //     if(event["confirm"]==true){
    //       Navigator.of(context).push(CupertinoPageRoute(builder:(context)=>const Bill()));
    //     }
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Image.asset(
            'assets/images/Alrashid_mall.png',
            width: 200,
            height: 200,
          ),
         const SizedBox(height: 30,),
         const Text("في انتظار تاكيد المبلغ ....",style: TextStyle(
             fontFamily: ('DINNextLTArabic'),
             fontSize: 15,color: Colors.black87)),

const SizedBox(height: 20,),
          InkWell(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (c) => // const
                    MyBottomNavyBar(
                      commingFromSplash: true,
                    )),
                    (route) => false),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              height: 40,
              child: const Center(
                child: Text(
                 "المبلغ غير صحيح",
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
        ],
      ),
    );
  }
}
