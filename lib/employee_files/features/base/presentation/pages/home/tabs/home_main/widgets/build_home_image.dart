part of 'home_main_widgets_imports.dart';

class BuildHomeImage extends StatelessWidget {
  final String logo ;
  const BuildHomeImage({Key? key, required this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      height: 100,
      width: 100,
      url: logo,
      boxShape: BoxShape.circle,
      borderColor: MyColors.primary.withOpacity(.3),
      bgColor: MyColors.primary,
      fit: BoxFit.fill,
      haveRadius: false,
      borderWidth: 1,
    );
  }
}
