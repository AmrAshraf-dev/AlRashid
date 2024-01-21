import 'dart:async';

import 'package:alrashid_mall_app/database.dart';
import 'package:flutter/material.dart';

import '../../utils/AnimationContainer.dart';

class Splash extends StatefulWidget {
  final Widget nextScreen;
  const Splash({Key? key, required this.nextScreen}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      DataInLocal.useValueToNavigate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const  BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/splash.png"), fit: BoxFit.fill)),
        child: Center(
          child: AnimationContainer(
              index: 0,
              vertical: true,
              duration: const Duration(milliseconds: 500),
              distance: MediaQuery.of(context).size.height * .3,
              child: Hero(
                tag: "assets/images/Alrashid_mall.png",
                child: Image.asset("assets/images/Alrashid_mall.png", width: 250, height: 250),
              )),
        ),
      ),
    );

    //   Scaffold(
    //   body: Stack(
    //     children: [
    //       Image.asset(
    //         'assets/images/splash.png',
    //         fit: BoxFit.cover,
    //         width: double.infinity,
    //         height: double.infinity,
    //       ),
    //       Center(
    //         child: Image.asset(
    //           'assets/images/Alrashid_mall.png',
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// await myAsyncFunction();
// if (mounted) {
//   updateUI();
// }
