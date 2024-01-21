import 'package:alrashid_mall_app/Views/UI/search_screen.dart';
import 'package:alrashid_mall_app/api/controllers/home_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/home_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/home_model.dart';
import 'package:alrashid_mall_app/widgets/stores_details.dart';
import 'package:alrashid_mall_app/widgets/trade_mark_list_for_stores.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Stores extends StatefulWidget {
  String? token;

  Stores({Key? key, this.token}) : super(key: key);

  @override
  State<Stores> createState() => _StoresState();
}

List<String>? categories;

class _StoresState extends State<Stores> {
  int selectedIndex = 0;
  int childIndex = 0;
  List<StoresPlacesModel> myChildesPlaces = [];
  List<Childes> myChildes = [];
  late final HomeCubit _blocCategories;

  @override
  void initState() {
    _blocCategories = BlocProvider.of<HomeCubit>(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _blocCategories
          .fetchAllData(context, widget.token ?? '')
          .whenComplete(() {
        setState(() {
          myChildes = HomeController.homeModel.categories?.first.childes ?? [];
          myChildesPlaces = HomeController.homeModel.categories?.first.childes
                  ?.first.storesPlacesModel ??
              [];
          for (var element in myChildes) {
            print("===========>> element ${element.toJson()}");
          }
          for (var element in myChildesPlaces) {
            print("===========>> item ${element.toJson()}");
          }
        });
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Directionality(
        textDirection: lang == 'ar' //locale?.locale.languageCode == 'en'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 15.0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Alrashid_mall.png',
                    width: 90,
                    height: 90,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SearchScreen())),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
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
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeController.homeModel.categories?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          myChildes = HomeController
                                  .homeModel.categories?[index].childes ??
                              [];
                          selectedIndex = index;
                          childIndex = 0;
                          myChildesPlaces = HomeController
                                  .homeModel
                                  .categories?[selectedIndex]
                                  .childes?[childIndex]
                                  .storesPlacesModel ??
                              [];
                        });
                      },
                      child: buildCategory(
                          index, HomeController.homeModel.categories![index]),
                    );
                  }),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myChildes.length,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          myChildesPlaces = HomeController
                                  .homeModel
                                  .categories?[selectedIndex]
                                  .childes?[position]
                                  .storesPlacesModel ??
                              [];
                          childIndex = position;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              myChildes[position].nameAr ?? '',
                              style: const TextStyle(
                                  color: Color(0xff333333),
                                  fontFamily: ('DINNextLTArabic'),
                                  fontSize: 12.0),
                            ),
                            const SizedBox(width: 30),
                            lang == 'en' //locale?.locale.languageCode == 'en'
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: height * 0.01,
                                        right: width * 0.03), //top padding 5
                                    height: 2,
                                    width: 30,
                                    color: childIndex == position
                                        ? Colors.black
                                        : Colors.transparent,
                                  )
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: height * 0.01,
                                        left: width * 0.03), //top padding 5
                                    height: 2,
                                    width: 30,
                                    color: childIndex == position
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(), // new
                  itemCount: // HomeController.homeModel.categories!.first.childes!.length,
                      myChildesPlaces.length,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => StoresDetails(
                                      storesDetailsID:
                                          myChildesPlaces[i].id.toString(),
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
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
                                child: myChildesPlaces[i].image!.contains('svg')
                                    ? SvgPicture.network(
                                        myChildesPlaces[i].image ?? '',
                                        fit: BoxFit.contain,
                                        width: 40,
                                        height: 30,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl:
                                            //'https://alrashid.hwzn.sa/public/storage/files/561672088130.png',
                                            // HomeController
                                            //         .homeModel
                                            //         .categories?[i]
                                            //         .childes?[i]
                                            //         .storesPlacesModel?[i]
                                            //         .image ??
                                            //     '',
                                            myChildesPlaces[i].image ?? '',
                                        width: 40,
                                        height: 30,
                                        fit: BoxFit.contain),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            lang == 'ar' // locale!.locale.languageCode == 'en'
                                ? Text(
                                    //'جيوردانو',
                                    lang == 'ar'
                                        ? myChildesPlaces[i].nameAr ?? ''
                                        : myChildesPlaces[i].nameEn ?? '',
                                    style: const TextStyle(
                                        color: Color(0xff333333),
                                        fontFamily: ('DINNextLTArabic'),
                                        fontSize: 16.0),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.3),
                                    child: Text(
                                      //'جيوردانو',
                                      lang == 'ar'
                                          ? myChildesPlaces[i].nameAr ?? ''
                                          : myChildesPlaces[i].nameEn ?? '',
                                      style: const TextStyle(
                                          color: Color(0xff333333),
                                          fontFamily: ('DINNextLTArabic'),
                                          fontSize: 20.0),
                                    ),
                                  ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  ///WIDGETS
  Widget buildCategory(int index, Categories categories) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    /// var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TradeMarksListForStores(
            token: widget.token,
            tradeMarkId: HomeController.homeModel.categories?[index].id,
            name: lang == 'ar'
                ? HomeController.homeModel.categories![index].nameAr ?? ''
                : HomeController.homeModel.categories![index].nameEn ?? '',
            //  image: HomeController.homeModel.categories?[index].image,
          ),
          const SizedBox(width: 30),
          lang == 'ar'
              ? Container(
                  margin: EdgeInsets.only(
                      top: height * 0.01, right: width * 0.03), //top padding 5
                  height: 2,
                  width: 30,
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.transparent,
                )
              : Container(
                  margin: EdgeInsets.only(
                      top: height * 0.01, left: width * 0.03), //top padding 5
                  height: 2,
                  width: 30,
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.transparent,
                ),
        ],
      ),
    );
  }
}
