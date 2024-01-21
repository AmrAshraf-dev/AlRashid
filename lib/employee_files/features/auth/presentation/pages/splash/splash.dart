part of 'splash_imports.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    controller.manipulateSaveData(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(Res.logoRashid), context);
    precacheImage(const AssetImage(Res.onboardingOne), context);
    precacheImage(const AssetImage(Res.onboardingTwo), context);
    precacheImage(const AssetImage(Res.onboardingTwo), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(Res.splash), fit: BoxFit.fill)),
        child: Center(
          child: AnimationContainer(
              index: 0,
              vertical: true,
              duration: const Duration(milliseconds: 800),
              distance: MediaQuery.of(context).size.height * .3,
              child: Hero(
                tag: Res.logoRashid,
                child: Image.asset(Res.logoRashid, width: 250, height: 250),
              )),
        ),
      ),
    );
  }
}
