part of 'qr_scan_widgets_imports.dart';

class BuildFaildQr extends StatelessWidget {
  final bool isLocation;

  const BuildFaildQr({
    Key? key,
    required this.isLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              decoration:
                  const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: const Icon(Icons.close, color: MyColors.white, size: 40),
            ),
            MyText(
              title: isLocation
                  ? "You can't Scan now, Your place is not valid"
                  : "You can't Scan now, Please try again in your work time",
              color: MyColors.black,
              size: 12,
              fontWeight: FontWeight.bold,
              alien: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
