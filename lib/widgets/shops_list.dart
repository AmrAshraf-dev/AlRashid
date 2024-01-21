import 'package:flutter/material.dart';

class ShopsList extends StatelessWidget {
  final String? name;
  final String? floorNumber;
  const ShopsList({
    Key? key,
    this.name,
    this.floorNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text(
            name ?? 'network failed',
            style: const TextStyle(
                color: Color(0xff333333),
                fontFamily: ('DINNextLTArabic'),
                fontSize: 16.0),
          ),
          const Spacer(),
          Text(
            floorNumber ?? 'network failed',
            style: const TextStyle(
                color: Color(0xffa6a6a6),
                fontFamily: ('DINNextLTArabic'),
                fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
