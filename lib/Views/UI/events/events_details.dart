import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/Views/UI/events/events_show_indetails.dart';
import 'package:alrashid_mall_app/api/controllers/all_events_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventsDetails extends StatefulWidget {
  final String? token;
  final String? name;
  final String? startAt;
  final String? eventId;
  final String? image;
  List<EventsModel>? eventsModel;
  EventsDetails(
      {Key? key,
      this.token,
      this.name,
      this.startAt,
      this.eventId,
      this.image,
      this.eventsModel})
      : super(key: key);

  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  @override
  void initState() {
    // final AllEventsCubit _allEventsBloc =
    //     BlocProvider.of<AllEventsCubit>(context);
    //print('eventttt IDDDDD $eventid');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // print(
    //     'sssssssssssss -- ${AllEventsController.allEventsModel.showAlleventsModel![0].id}');
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Column(
        children: [
          Directionality(
            textDirection: lang == 'ar' // locale!.locale.languageCode == 'en'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Row(
                children: [
                  InkWell(
                    // onTap: () => Navigator.pop(context),
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MyBottomNavyBar())),
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
                  Text(
                    tr('events'), //locale.events!,
                    style: const TextStyle(
                        color: Color(0xff333333),
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
          Directionality(
            textDirection: lang == 'ar' //locale.locale.languageCode == 'en'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Flexible(
              child: SizedBox(
                width: double.infinity,
                //height: 600,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 24.0),
                    //scrollDirection: Axis.vertical,
                    itemCount: AllEventsController
                        .allEventsModel.showAlleventsModel!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          print(AllEventsController
                              .allEventsModel.showAlleventsModel![index].id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => EventsShowInDetails(
                                        eventID: AllEventsController
                                            .allEventsModel
                                            .showAlleventsModel![index]
                                            .id
                                            .toString(),
                                      )));
                        },
                        child: SizedBox(
                          width: 162,
                          height: 172,
                          child: Stack(children: [
                            // Image.asset('assets/images/mask_group_2.png'),
                            AllEventsController.allEventsModel
                                    .showAlleventsModel![index].image!
                                    .contains('svg')
                                ? SvgPicture.network(
                                    AllEventsController.allEventsModel
                                            .showAlleventsModel![index].image ??
                                        _img,
                                    fit: BoxFit.cover,
                                    width: 162,
                                    height: 172,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: AllEventsController.allEventsModel
                                            .showAlleventsModel![index].image ??
                                        _img,
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: 60,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: const Color(0xffb83f48)),
                                child: Center(
                                  child: Text(
                                    // 'الآن',
                                    AllEventsController
                                            .allEventsModel
                                            .showAlleventsModel![index]
                                            .startAt ??
                                        'network failed',
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
                                  lang ==
                                          'ar' //  locale.locale.languageCode == 'en'
                                      ? AllEventsController
                                              .allEventsModel
                                              .showAlleventsModel![index]
                                              .nameAr ??
                                          'فشل في الانترنت'
                                      : AllEventsController
                                              .allEventsModel
                                              .showAlleventsModel![index]
                                              .nameEn ??
                                          'network failed',
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
                      );
                    },
                  ),
                ),
              ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
