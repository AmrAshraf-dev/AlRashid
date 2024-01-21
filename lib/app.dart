import 'package:alrashid_mall_app/Map_collection_package/core/viewmodels/floorplan_models.dart';
import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
// import 'package:alrashid_mall_app/Views/UI/splash.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/all_categories_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/all_events_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/categoriesbyid_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/coupons_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/events_by_id_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/home_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/lines_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/positions_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/routes_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/services_details_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/stores_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/stores_details_cubit%20.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/user_data_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/verfiy_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/search_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/firebase_analytics_helper.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/splash/splash_imports.dart';
import 'package:alrashid_mall_app/locale/language_cubit.dart';
import 'package:alrashid_mall_app/utils/GlobalNotification.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
//import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'locale/locale.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '0';
  // checkToken() async {
  //   token = await DataInLocal.readTokenFromLocal(isRefToken: false);
  //   prepareHome(context);
  //   setState(() {});
  // }
  final _appRouter = AppRouter(getIt<GlobalContext>().navigationKey);

  @override
  void initState() {
    // getIt<FirebaseAnalyticsHelper>().analytics.setConsent(
    //     adStorageConsentGranted: false, analyticsStorageConsentGranted: true);
    super.initState();
    // checkToken();
  }

  @override
  Widget build(BuildContext context) {
    GlobalNotification().setupNotification(context);
    return MultiProvider(
      providers: [
        // GeneralProviders.instance.providers(context),
        ChangeNotifierProvider<FloorPlanModel>(
            create: (context) => FloorPlanModel()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => AllEventsCubit()),
        BlocProvider(create: (context) => EventsByIdCubit()),
        BlocProvider(create: (context) => ServicesDetailsCubit()),
        BlocProvider(create: (context) => VerfiyCubit()),
        BlocProvider(create: (context) => StoresCubit()),
        BlocProvider(create: (context) => StoresDetailsCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => CouponsCubit()),
        BlocProvider(create: (context) => UsersCubit()),
        BlocProvider(create: (context) => AllCategoriesCubit()),
        BlocProvider(create: (context) => CategoriesByIdCubit()),
        BlocProvider(create: (context) => PoistionsCubit()),
        BlocProvider(create: (context) => RoutesCubit()),
        BlocProvider(create: (context) => LinesCubit()),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
              designSize: const Size(1000, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                    navigatorKey: GlobalState.instance.navigatorKey,
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    localizationsDelegates: const [
                      // AppLocalizationsDelegate(),
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('ar'),
                      Locale('en'),
                    ],
                    locale: locale,
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                      //visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return FlutterEasyLoading(
                        child: GestureDetector(
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          child: child,
                        ),
                      );
                    },
                    // supportedLocales: L10n.all,
                    home: const Splash()
                    //  Splash(
                    //   nextScreen: MyBottomNavyBar(
                    //     token: token,
                    //     commingFromSplash: true,
                    //   ),
                    // ),
                    );
              });
        },
      ),
    );
  }
}

Future prepareHome(BuildContext context) async {
  final HomeCubit _bloc = BlocProvider.of<HomeCubit>(context);
  _bloc.fetchAllData(context, '0');
}
