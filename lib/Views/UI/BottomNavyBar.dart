import 'package:alrashid_mall_app/Views/UI/Indoor_maps/MapScreen.dart';
import 'package:alrashid_mall_app/Views/UI/homepage.dart';
import 'package:alrashid_mall_app/Views/UI/Profile/profile-nologin.dart';
import 'package:alrashid_mall_app/Views/UI/stores/stores.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavyBar extends StatefulWidget {
  final String? token;
  final bool commingFromSplash;
  int currentIndex = 0;
  MyBottomNavyBar({
    Key? key,
    this.token,
    this.commingFromSplash = false,
  }) : super(key: key);

  @override
  State<MyBottomNavyBar> createState() => _MyBottomNavyBarState();
}

class _MyBottomNavyBarState extends State<MyBottomNavyBar> {
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

  // int currentIndex = 0;

  List children = [
    Homepage(),
    //const Chatbot(),
    Stores(),
    const MapScreen(),
    const ProfileNoLogin()
  ];

  // static const TextStyle optionStyle =
  //     TextStyle(fontFamily: ('DINNextLTArabic'), color: Colors.black);

  void _onItemTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Directionality(
      textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: WillPopScope(
        onWillPop: onBackPressed,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: const Color(0xff000000),
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: ('DINNextLTArabic')),
            showUnselectedLabels: true,
            unselectedLabelStyle:
                const TextStyle(fontFamily: ('DINNextLTArabic')),
            selectedIconTheme: const IconThemeData(
                color: Color(0xffb83f48), size: 25, opacity: .8),
            unselectedIconTheme: const IconThemeData(
                color: Color(0xffb83f48), size: 25, opacity: .8),
            //backgroundColor: ,
            // selectedIndex: _currentIndex,
            // showElevation: true,
            // itemCornerRadius: 24,
            // curve: Curves.easeIn,
            // onItemSelected: (index) => setState(() => _currentIndex = index),
            items: [
              BottomNavigationBarItem(
                //backgroundColor: Color(0xffEF9A9A),
                icon: const ImageIcon(
                  AssetImage('assets/icons/home_icon.png'),
                ),
                label: tr('home'),

                // title: const Text(
                //   'الرئيسية',
                //   style: TextStyle(fontFamily: ('DINNextLTArabic')),
                // ),
                // activeColor: const Color(0XFFb83f48),
                // inactiveColor: const Color(0XFFa6a6a6),
                // textAlign: TextAlign.center,
              ),
              // BottomNavyBarItem(
              //   icon: const ImageIcon(
              //     AssetImage('assets/icons/chatbot.png'),
              //   ),
              //   title: const Text(
              //     'المحادثه',
              //     style: TextStyle(fontFamily: ('DINNextLTArabic')),
              //   ),
              //   activeColor: const Color(0XFFb83f48),
              //   inactiveColor: const Color(0XFFa6a6a6),
              //   textAlign: TextAlign.center,
              // ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/icons/store.png'),
                ),
                label: tr('shops'),

                // activeColor: const Color(0XFFb83f48),
                // inactiveColor: const Color(0XFFa6a6a6),
                // textAlign: TextAlign.center,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/icons/map_icon.png'),
                ),
                label: tr('maps'),

                // activeColor: const Color(0XFFb83f48),
                // inactiveColor: const Color(0XFFa6a6a6),
                // textAlign: TextAlign.center,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                ),
                label: tr('My account'),

                // activeColor: const Color(0XFFb83f48),
                // inactiveColor: const Color(0XFFa6a6a6),
                // textAlign: TextAlign.center,
              ),
            ],
            currentIndex: widget.currentIndex,
            selectedItemColor: const Color(0xffb83f48),
            onTap: _onItemTapped,
          ),
          body: children
              .elementAt(widget.currentIndex), //children[_currentIndex],
        ),
      ),
    );
  }
}
