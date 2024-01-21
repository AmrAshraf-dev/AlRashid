import 'package:alrashid_mall_app/Views/UI/Indoor_maps/from_to_blaza.dart';
import 'package:alrashid_mall_app/api/controllers/all_events_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/events_by_id_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/events_by_id_state.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/widgets/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class EventsShowInDetails extends StatefulWidget {
  String? token;
  String? name;
  String? startAt;
  String? endAt;
  String? eventID;
  String? image;
  String? description;

  EventsShowInDetails({
    Key? key,
    this.token,
    this.name,
    this.startAt,
    this.endAt,
    this.eventID,
    this.image,
    this.description,
  }) : super(key: key);

  @override
  State<EventsShowInDetails> createState() => _EventsShowInDetailsState();
}

class _EventsShowInDetailsState extends State<EventsShowInDetails> {
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    final EventsByIdCubit _blocEventsById =
        BlocProvider.of<EventsByIdCubit>(context);
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    print(
      widget.eventID.toString(),
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // ignore: avoid_single_cascade_in_expression_statements
      _blocEventsById.fetchEventsDataById(
        context,
        widget.token ?? '',
        //widget.fetchEventsById!,
        eventId: widget.eventID.toString(),
      );
      print('iddddddddddddddddddddddddd : ${widget.eventID.toString()}');
      //   ..then((value) {
      //       setState(() {
      //         loader = true;
      //       });
      //     });
    });
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(body:
            //  BlocProvider(
            //     create: (context) => EventsByIdCubit()
            //       ..fetchEventsDataById(
            //         context,
            //         widget.token ?? '',
            //         //widget.fetchEventsById!,
            //         eventId: widget.eventID.toString(),
            //       ),
            //     child:
            BlocBuilder<EventsByIdCubit, EventsByIdState>(
                // bloc: _blocEventsById,
                builder: (context, state) {
      // AllEventsController.eventsByIdModel.eventsById!.id!;
      return _blocEventsById.loading
          ? ListView.separated(
              itemBuilder: (c, i) => const ShimmerWidget(),
              itemCount: 2,
              separatorBuilder: (c, i) => const SizedBox(
                height: 10,
              ),
            )
          : _blocEventsById.err
              ? const Center(
                  child: Text(
                    'هناك خطأ', //locale!.error!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: null,
                  ),
                )
              // : widget.fetchEventsById! &&
              //         AllEventsController
              //                 .eventsByIdModel.eventsById!.id ==
              //             0
              //     ? const Center(
              //         child: Text(
              //           'لا يوجد عناصر', //locale.noElements!,
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontFamily: ('DINNextLTArabic'),
              //             fontSize: 16.0,
              //             fontWeight: FontWeight.bold,
              //           ),
              //           maxLines: null,
              //         ),
              //       )
              :

              //  return
              // loader == true
              //?
              Directionality(
                  textDirection:
                      lang == 'ar' //locale!.locale.languageCode == 'en'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                  child: Stack(
                    children: [
                      // Image.asset(
                      //   'assets/images/events_details.png',
                      AllEventsController.eventsByIdModel.eventsById!.image!
                              .contains('svg')
                          ? SvgPicture.network(
                              AllEventsController
                                      .eventsByIdModel.eventsById!.image ??
                                  _img,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            )
                          : CachedNetworkImage(
                              imageUrl: AllEventsController
                                      .eventsByIdModel.eventsById!.image ??
                                  _img,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                      Image.asset(
                        'assets/images/pexels_delbeautybox_705255.png',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Directionality(
                          textDirection:
                              lang == 'ar' //locale.locale.languageCode == 'en'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: const Color(0xff2eb83f48),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 18,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Directionality(
                        textDirection:
                            lang == 'ar' //locale.locale.languageCode == 'en'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                        child: Padding(
                          padding: EdgeInsets.only(top: myheight * 0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  // 'رد تاغ - RED TAG ',
                                  lang ==
                                          'ar' //  locale.locale.languageCode == 'en'
                                      ? AllEventsController.eventsByIdModel
                                              .eventsById!.nameAr ??
                                          'فشل في الانترنت'
                                      : AllEventsController.eventsByIdModel
                                              .eventsById!.nameEn ??
                                          'network failed',
                                  style: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: ('DINNextLTArabic'),
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                //' Dec 20 - Mar 31',
                                '${AllEventsController.eventsByIdModel.eventsById!.startAt} - ${AllEventsController.eventsByIdModel.eventsById!.endAt}',

                                style: const TextStyle(
                                    color: Color(0xffffffff),
                                    fontFamily: ('DINNextLTArabic'),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  //'استمتعوا بتجربة التسوق الرائعه بالتخفيضات والعروض الهائلة لدينا',
                                  lang ==
                                          'ar' //  locale.locale.languageCode == 'en'
                                      ? AllEventsController.eventsByIdModel
                                              .eventsById!.descriptionAr ??
                                          'فشل في الانترنت'
                                      : AllEventsController.eventsByIdModel
                                              .eventsById!.descriptionEn ??
                                          'network failed',
                                  // maxLines: 2,
                                  // overflow: TextOverflow.clip,
                                  // softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xffffffff),
                                    fontFamily: ('DINNextLTArabic'),
                                    fontSize: 17.0,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (c) => FromToBlaza()));
                              //   },
                              //   child: Container(
                              //     width: 350,
                              //     height: 45,
                              //     child: Center(
                              //       child: Text(
                              //         locale.showShop!,
                              //         style: const TextStyle(
                              //           color: Color.fromARGB(255, 33, 32, 32),
                              //           fontFamily: ('DINNextLTArabic'),
                              //           fontSize: 18.0,
                              //         ),
                              //       ),
                              //     ),
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: const Color(0xffffffff),
                              //       ),
                              //       borderRadius: BorderRadius.circular(22),
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
      //: const Center(child: ShimmerWidget());
    })
        //),
        );
  }
}
