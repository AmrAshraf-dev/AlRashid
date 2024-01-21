import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TradeMarksList extends StatelessWidget {
  final String? token;
  final int? tradeMarkId;
  final String? name;
  final String? image;
  const TradeMarksList({
    Key? key,
    this.token,
    this.tradeMarkId,
    this.name,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('imaagee ==> $image');
    print('name ==> $name');
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return GestureDetector(
      child: Directionality(
        textDirection: lang == 'en' //locale!.locale.languageCode == 'en'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 90,
            height: 20,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(color: const Color(0xffBDBDBD)),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ), //BorderRadius.all
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image!.contains('svg')
                    ? SvgPicture.network(
                        image ?? _img,
                        fit: BoxFit.cover,
                        width: 48,
                        height: 32,
                      )
                    : CachedNetworkImage(
                        imageUrl: image ?? _img,
                        fit: BoxFit.cover,
                        width: 48,
                        height: 32,
                      ),
                Text(
                  name ?? 'network failed',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Color(0xff333333),
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 11.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
