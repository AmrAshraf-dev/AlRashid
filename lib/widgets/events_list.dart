import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventsList extends StatelessWidget {
  final String? token;
  final String? name;
  final String? startAt;
  final num? eventID;
  final String? image;
  const EventsList(
      {Key? key, this.token, this.name, this.startAt, this.eventID, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(5.0),
          child: Stack(children: [
            // Image.asset('assets/images/mask_group_2.png'),
            image!.contains('svg')
                ? SvgPicture.network(
                    image ?? _img,
                    fit: BoxFit.cover,
                    width: 162,
                    height: 172,
                  )
                : CachedNetworkImage(
                    imageUrl: image ?? _img,
                    fit: BoxFit.cover,
                    width: 162,
                    height: 172,
                  ),
            Image.asset(
              'assets/images/pexels_delbeautybox_705255.png',
              fit: BoxFit.cover,
              width: 162,
              height: 172,
            ),
            Directionality(
              textDirection: lang == 'en' //locale.locale.languageCode == 'en'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffb83f48)),
                child: Center(
                  child: Text(
                    // 'الآن',
                    startAt ?? 'network failed',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 10.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  // 'فرزاتشى-VERSACE',
                  name ?? 'network failed',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 14.0),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
