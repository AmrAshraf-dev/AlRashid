part of 'product_value_widgets_imports.dart';

class BuildValueButton extends StatelessWidget {
  const BuildValueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: const Text(
              "المتابعه",
              style: TextStyle(color: Colors.green, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
