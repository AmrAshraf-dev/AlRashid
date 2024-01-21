part of 'home_widgets_imports.dart';

class BuildTabIcon extends StatelessWidget {
  final int index;
  final bool active;
  final HomeController controller;
  const BuildTabIcon({required this.index, required this.active, required this.controller});

  @override
  Widget build(BuildContext context) {
    Color color = active ? MyColors.primary : MyColors.grey;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          const SizedBox(height: 4),
          Icon(
            controller.tabs[index],
            size: 25,
            color: color,
          ),
          const SizedBox(height: 2),
          MyText(
            title: controller.tabsTxt[index],
            color: color,
            size: 10,
            fontWeight: FontWeight.w500,
          )
        ],
      )
    );
  }
}
