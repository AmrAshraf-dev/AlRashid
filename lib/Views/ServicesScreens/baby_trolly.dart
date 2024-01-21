import 'package:flutter/material.dart';

class BabyTrolly extends StatelessWidget {
  const BabyTrolly({Key? key}) : super(key: key);

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
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: Color(0xff2eb83f48),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: mywidth * 0.02),
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: myheight * 0.3,
        ),
        Image.asset(
          'assets/icons/layer_11.png',
          width: 32.0,
          height: 32.0,
        ),
        SizedBox(
          height: myheight * 0.02,
        ),
        const Text(
          'عربات للاطفال',
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
            'لجعل تجربة التسوق اكثر متعه وسهوله مع اطفالك تتوفر عربات الأطفال في المول',
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
