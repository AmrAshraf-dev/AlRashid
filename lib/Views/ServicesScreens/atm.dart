import 'package:flutter/material.dart';

class ATM extends StatelessWidget {
  const ATM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
                padding :const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(shape: BoxShape.rectangle,
                  color: const Color(0xff2eb83f48),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.black,)),
          ),
        ),
        SizedBox(
          height: myheight * 0.3,
        ),
        Image.asset(
          'assets/icons/layer_10.png',
          width: 32.0,
          height: 32.0,
        ),
        SizedBox(
          height: myheight * 0.02,
        ),
        const Text(
          'أجهزة الصراف الآلى',
          style: TextStyle(
              color: Color(0xff333333),
              fontFamily: ('DINNextLTArabic'),
              fontSize: 24.0),
        ),
        SizedBox(
          height: myheight * 0.05,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'يوفر المول أجهزة الصراف الآلى والمتواجده في جميع انحاء المركز',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffa6a6a6),
                fontFamily: ('DINNextLTArabic'),
                fontSize: 20.0),
          ),
        ),
      ]),
    );
  }
}
