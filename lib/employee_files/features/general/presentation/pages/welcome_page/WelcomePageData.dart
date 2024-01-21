part of 'WelcomePageImports.dart';

class WelcomePageData {
  GenericBloc<int> pagesCubit = GenericBloc(0);
  List<Widget> data = [];

  void initPagesData() {
    data = [
      BuildPageView(
        key: const Key("1"),
        model: WelcomeEntity(
            title: "العالم بين يديك",
            desc:
                " العالم بين يديك في مجمع الراشد ينبغي ان تحصل على يوم لا ينسى ",
            image: Res.onboardingOne,
            index: 0,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: const Key("2"),
        model: WelcomeEntity(
            title: "العالم بين يديك",
            desc:
                " العالم بين يديك في مجمع الراشد ينبغي ان تحصل على يوم لا ينسى ",
            image: Res.onboardingTwo,
            index: 1,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: const Key("3"),
        model: WelcomeEntity(
            title: "العالم بين يديك",
            desc:
                " العالم بين يديك في مجمع الراشد ينبغي ان تحصل على يوم لا ينسى ",
            image: Res.onboardingThree,
            last: true,
            index: 2,
            pageCubit: pagesCubit),
      ),
    ];
  }
}
