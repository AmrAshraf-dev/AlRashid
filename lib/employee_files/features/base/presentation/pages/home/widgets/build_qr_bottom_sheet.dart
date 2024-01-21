part of'home_widgets_imports.dart';
class BuildQrBottomSheet extends StatelessWidget {
  const BuildQrBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(

        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: const Icon(Icons.close),),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 40),
            child: QrImage(
              errorStateBuilder: (cxt, err) {
                return Container(
                  child: Center(
                    child: Text(
                      tr("sorry"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              data: tr("QREmbeddedImage"),
              version: QrVersions.auto,
              size: 320,
              gapless: false,
              embeddedImage: const AssetImage('assets/images/my_embedded_image.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: const Size(80, 80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
