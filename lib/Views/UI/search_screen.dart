import 'package:alrashid_mall_app/api/controllers/stroes_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/stores_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/Stores_model.dart';
import 'package:alrashid_mall_app/widgets/stores_details.dart';
import 'package:alrashid_mall_app/widgets/stores_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  String? query;
  String? token;
  String? keyword;
  String? searchId;
  SearchScreen({
    Key? key,
    this.query,
    this.token,
    this.keyword,
    this.searchId,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<StoresPlacesModel> places = [];
  final searchController = TextEditingController();
  late StoresCubit _blocStores;

  @override
  void initState() {
    _blocStores = BlocProvider.of<StoresCubit>(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _blocStores
          .fetchAllStoresData(context, widget.token ?? '')
          .whenComplete(() {
        setState(() {
          places = StoresController.storesModel.storesPlacesModel ?? [];
        });
      });
    });
    super.initState();
  }

  handleSearch(String name) {
    if (name.trim().isEmpty) {
      places = StoresController.storesModel.storesPlacesModel ?? [];
      setState(() {});
      return;
    }
    places = places
        .where((element) =>
            (element.name!.toLowerCase().contains(name.toLowerCase())
            //||element.nameEn!.toLowerCase().contains(name.toLowerCase())
            ))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Directionality(
        textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                children: [
                  InkWell(
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
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    tr('search'),
                    style: const TextStyle(
                        color: Color(0xff333333),
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),

            /// Search TextFormFiled
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searchController,
                onChanged: handleSearch,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xff737373),
                  ),
                  hintText: tr('search'),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: const Color(0xfff2f2f2),
                  filled: true,
                ),
              ),
            ),

            ///Search result view
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(), //
                padding: const EdgeInsets.symmetric(vertical: 0),
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => StoresDetails(
                                  storesDetailsID: places[index].id.toString(),
                                ))),
                    child: Directionality(
                      textDirection:
                          lang == 'ar' //locale.locale.languageCode == 'en'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                      child: StoresList(
                        image: places[index].image,
                        name: places[index].name ?? 'no data',
                        // locale.locale.languageCode == 'en'
                        //     ? places[index].nameAr
                        //     : places[index].nameEn,
                        floorNumber: places[index].floor.toString(),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
