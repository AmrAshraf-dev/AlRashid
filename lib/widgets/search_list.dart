import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchList extends StatelessWidget {
  final String? token;
  final String? name;
  final String? floorNumber;
  final num? searchID;
  final String? image;
  const SearchList(
      {Key? key,
      this.token,
      this.name,
      this.floorNumber,
      this.searchID,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Directionality(
      textDirection: lang == 'en' //locale!.locale.languageCode == 'en'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Center(
                // child: Image.asset(
                //   'assets/images/giordano.png',
                //   width: 50,
                //   height: 32,
                // ),
                child: image!.contains('svg')
                    ? SvgPicture.network(
                        image ?? _img,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 32,
                      )
                    : CachedNetworkImage(
                        imageUrl: image ?? _img,
                        width: 50,
                        height: 32,
                        fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.3),
              child: Text(
                //'جيوردانو',
                name ?? 'network failed',
                style: const TextStyle(
                    color: Color(0xff333333),
                    fontFamily: ('DINNextLTArabic'),
                    fontSize: 20.0),
              ),
            ),
            Text(
              //'الدور الارضي',
              floorNumber ?? 'network failed',
              style: const TextStyle(
                  color: Color(0xffa6a6a6),
                  fontFamily: ('DINNextLTArabic'),
                  fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
    // const Padding(
    //   padding: EdgeInsets.only(left: 25.0, right: 25.0),
    //   child: Divider(
    //     color: Color(0xfff2f2f2),
    //     thickness: 2,
    //   ),
    // ),
  }
}
