part of'employees_widgets_imports.dart';
class BuildTapBar extends StatelessWidget {
  const BuildTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: MyColors.offWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.grey, width: .5),
      ),
      child: TabBar(
          indicatorColor: MyColors.primary,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.black,
          labelColor: MyColors.white,
          physics: const AlwaysScrollableScrollPhysics(),
          indicator: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          tabs: [
            Tab(
              text: tr("orders"),
            ),
            Tab(
              text: tr("employees"),
            ),
          ]),
    );
  }
}
