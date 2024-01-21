part of 'WelcomePageImports.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomePageData welcomePageData = WelcomePageData();

  @override
  void initState() {
    welcomePageData.initPagesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: welcomePageData.pagesCubit,
              builder: (_, state) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1500),
                  reverseDuration: const Duration(milliseconds: 1500),
                  child: welcomePageData.data[state.data],
                  transitionBuilder: (child, animation) =>
                      FadeTransition(child: child, opacity: animation),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut))),
      onWillPop: () async => false,
    );
  }
}
