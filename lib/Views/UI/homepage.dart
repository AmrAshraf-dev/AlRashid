//import 'dart:html';

import 'dart:convert';

import 'package:alrashid_mall_app/Views/ServicesScreens/services_details_screen.dart';
import 'package:alrashid_mall_app/Views/UI/chatbot/chatbot.dart';
import 'package:alrashid_mall_app/Views/UI/events/events_details.dart';
import 'package:alrashid_mall_app/Views/UI/events/events_show_indetails.dart';
import 'package:alrashid_mall_app/Views/UI/search_screen.dart';
import 'package:alrashid_mall_app/Views/UI/trade_marks/trade_marks_show_all.dart';
import 'package:alrashid_mall_app/api/controllers/all_categories_controller.dart';
import 'package:alrashid_mall_app/api/controllers/all_events_controller.dart';
import 'package:alrashid_mall_app/api/controllers/home_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/all_events_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/home_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/home_state.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:alrashid_mall_app/widgets/events_list.dart';
import 'package:alrashid_mall_app/widgets/home_slider.dart';
import 'package:alrashid_mall_app/widgets/services_list.dart';
import 'package:alrashid_mall_app/widgets/shimmer_widget.dart';
import 'package:alrashid_mall_app/widgets/trade_marks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  String? token;
  bool? commingFromSplash;

  Homepage({
    Key? key,
    this.token,
    this.commingFromSplash = false,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool hide = false;

  final bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    final HomeCubit _bloc = BlocProvider.of<HomeCubit>(context);
    final AllEventsCubit _allEventsBloc =
        BlocProvider.of<AllEventsCubit>(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const duration = Duration(milliseconds: 300);
    // print(widget.token);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (widget.commingFromSplash!) {
        return;
      } else {
        _bloc.fetchAllData(context, widget.token ?? '');
        _allEventsBloc.fetchAllEventsData(context, widget.token ?? '');
      }
      _bloc.fetchAllData(context, widget.token ?? '');
      _allEventsBloc.fetchAllEventsData(context, widget.token ?? '');
    });
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      floatingActionButton: //hide == false
          //?
          // Badge(
          // badgeColor: const Color(0xffE0E0E0),
          // borderRadius: BorderRadius.circular(40),
          // badgeContent: GestureDetector(
          //   onTap: () {
          //     //hide == true;
          //     setState(() {
          //       hide == true ? const Offstage() : const BadgeWidget();
          //     });
          //     print('close icon');
          //   },
          //   child: const Icon(
          //     Icons.close,
          //     color: Colors.black,
          //     size: 15.0,
          //   ),
          // ),
          //child:
          AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              backgroundColor: const Color(0xffb83f48),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Chatbot()
                    // ProfileNoLogin(),
                    ));
              },
              tooltip: 'chat with us',
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        //   ProfileNoLogin(),
                        const Chatbot())),
                child: Image.asset(
                  'assets/icons/customer_service.png',
                  color: Colors.white,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ),
      ),
      //),
      //: const Offstage(),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          return _bloc.loading
              ? ListView.separated(
                  itemBuilder: (c, i) => const ShimmerWidget(),
                  itemCount: 6,
                  separatorBuilder: (c, i) => const SizedBox(
                    height: 10,
                  ),
                )
              : _bloc.err
                  ? Center(
                      child: Text(
                        tr('Error'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: null,
                      ),
                    )
                  : NotificationListener<UserScrollNotification>(
                      // onNotification: (notification) {
                      //   final ScrollDirection direction =
                      //       notification.direction;
                      //   setState(() {
                      //     if (direction == ScrollDirection.reverse) {
                      //       _showFab = false;
                      //     } else if (direction == ScrollDirection.forward) {
                      //       _showFab = true;
                      //     }
                      //   });
                      //   return true;
                      // },
                      child: Directionality(
                        textDirection: lang == 'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25.0, left: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/Alrashid_mall.png',
                                        width: 90,
                                        height: 90,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SearchScreen())),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(25),
                                            ), //BorderRadius.all
                                          ),
                                          child: const Icon(
                                            Icons.search,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ///END OF MY SLIDER
                                const HomeSlider(),

                                ///العلامات التجارية
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tr('Sections'),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: ('DINNextLTArabic'),
                                            fontSize: 18.0),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          TradeMarksShowAll()));
                                        },
                                        child: Text(
                                          tr('See all'),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xffa6a6a6),
                                              fontFamily: ('DINNextLTArabic'),
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ///العلامات التجارية list
                                SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: HomeController
                                              .homeModel.categories?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        GlobalState.instance.set(
                                            'cats',
                                            json.encode(HomeController
                                                .homeModel.categories));
                                        return GestureDetector(
                                          onTap: () {
                                            print(
                                                'categoriesss idd :::::${AllCategoriesController.allCategoriesModel.categoriesModel?[i].parentId.toString()}');

                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (c) =>
                                            //             TradeMarksShowInDetails(
                                            //               tradeMarkID: HomeController
                                            //                       .homeModel
                                            //                       .categories?[
                                            //                           i]
                                            //                       .id
                                            //                       .toString() ??
                                            //                   '',
                                            //             )));
                                          },
                                          child: TradeMarksList(
                                            token: widget.token,
                                            tradeMarkId: HomeController
                                                .homeModel.categories?[i].id,
                                            name: lang ==
                                                    'ar' //locale.locale.languageCode == 'en'
                                                ? HomeController
                                                        .homeModel
                                                        .categories![i]
                                                        .nameAr ??
                                                    ''
                                                : HomeController
                                                        .homeModel
                                                        .categories![i]
                                                        .nameEn ??
                                                    '',
                                            image: HomeController
                                                .homeModel.categories?[i].image,
                                          ),
                                        );
                                      }),
                                ),

                                ///الفعاليات

                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tr('events'),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: ('DINNextLTArabic'),
                                            fontSize: 18.0),
                                      ),
                                      GestureDetector(
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                EventsDetails(),
                                          ),
                                        ),
                                        child: Text(
                                          tr('See all'),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xffa6a6a6),
                                              fontFamily: ('DINNextLTArabic'),
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ///EVENTS LIST
                                SizedBox(
                                  width: double.infinity,
                                  height: 172,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: HomeController
                                          .homeModel.eventsModel!.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (c) =>
                                                        EventsShowInDetails(
                                                          eventID: AllEventsController
                                                              .allEventsModel
                                                              .showAlleventsModel![
                                                                  i]
                                                              .id
                                                              .toString(),
                                                        )));
                                          },
                                          child: EventsList(
                                            token: widget.token,
                                            image: HomeController.homeModel
                                                .eventsModel![i].image,
                                            eventID: HomeController
                                                .homeModel.eventsModel![i].id,
                                            name: lang == 'ar'
                                                ? HomeController.homeModel
                                                    .eventsModel![i].nameAr
                                                : HomeController.homeModel
                                                    .eventsModel![i].nameEn,
                                            startAt: HomeController.homeModel
                                                .eventsModel![i].startAt,
                                          ),
                                        );
                                      }),
                                ),

                                ///الخدمات
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      tr('services'),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: ('DINNextLTArabic'),
                                          fontSize: 18.0),
                                    ),
                                  ),
                                ),

                                ///
                                SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: HomeController
                                          .homeModel.servicesModel!.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (c) => ServicesDetails(
                                                        servicesID:
                                                            HomeController
                                                                .homeModel
                                                                .servicesModel![
                                                                    i]
                                                                .id
                                                                .toString())));

                                            // servicesID: AllEventsController
                                            //     .allEventsModel
                                            //     .showAlleventsModel![
                                            //         i]
                                            //     .id
                                            //     .toString(),
                                            // )));
                                          },
                                          child: Services(
                                            token: widget.token,
                                            image: HomeController.homeModel
                                                .servicesModel![i].image,
                                            serviceID: HomeController
                                                .homeModel.servicesModel![i].id,
                                            name: lang == 'ar'
                                                ? HomeController.homeModel
                                                    .servicesModel![i].nameAr
                                                : HomeController.homeModel
                                                    .servicesModel![i].nameEn,
                                          ),
                                        );
                                      }),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
