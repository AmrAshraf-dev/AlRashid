part of 'home_widgets_imports.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  final HomeController controller;

  const BuildBottomNavigationBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: controller.homeTabCubit,
      builder: (context, state) {
        return AnimatedBottomNavigationBar.builder(
          itemCount: 2,
          tabBuilder: (int index, bool isActive) {
            return BuildTabIcon(
              index: index,
              active: isActive,
              controller: controller,
            );
          },

          backgroundColor: Colors.white,
          splashColor: MyColors.secondary,
          activeIndex: state.data,
          notchSmoothness: NotchSmoothness.softEdge,
          gapLocation: GapLocation.center,
          splashSpeedInMilliseconds: 300,
          height: 70,
          onTap: (index) => controller.animateTabsPages(index, context),
        );
      },
    );
  }
}
