import 'package:alrashid_mall_app/Map_collection_package/core/viewmodels/floorplan_models.dart';
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
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/manager/setting_cubit/setting_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/location_address/location_cubit/location_cubit.dart';
import 'package:alrashid_mall_app/locale/language_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/bloc/lang_cubit/lang_cubit.dart';
import 'core/helpers/app_them.dart';
import 'core/helpers/firebase_analytics_helper.dart';
import 'core/helpers/general_providers.dart';
import 'core/localization/set_localization.dart';
import 'core/routes/router_imports.gr.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter(getIt<GlobalContext>().navigationKey);

  @override
  void initState() {
    //getIt.registerSingleton(SharedPreferences.getInstance());
    getIt<FirebaseAnalyticsHelper>().analytics.setConsent(
        adStorageConsentGranted: false, analyticsStorageConsentGranted: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: //GeneralProviders.instance.providers(context),
          [
        ChangeNotifierProvider<FloorPlanModel>(
            create: (context) => FloorPlanModel()),
        BlocProvider<AuthCubit>(create: (BuildContext context) => AuthCubit()),
        BlocProvider<LangCubit>(create: (BuildContext context) => LangCubit()),
        BlocProvider<UserCubit>(create: (BuildContext context) => UserCubit()),
        BlocProvider<LocationCubit>(
            create: (BuildContext context) => LocationCubit()),
        BlocProvider<SettingCubit>(
            create: (BuildContext context) => SettingCubit()),
//=======================================================

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
      child: BlocBuilder<LangCubit, LangState>(
        // BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          //locale) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppThem.instance.themeData,
              title: "Alrashid merchant's",
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ar', 'EG'),
                // Locale('ar'),
                // Locale('en'),
              ],
              localizationsDelegates: const [
                // AppLocalizationsDelegate(),
                SetLocalization.localizationsDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state.locale, //locale,
              routerDelegate: _appRouter.delegate(
                  initialRoutes: [const SplashRoute()],
                  navigatorObservers: () {
                    return [
                      FirebaseAnalyticsObserver(
                          analytics: getIt<FirebaseAnalyticsHelper>().analytics)
                    ];
                  }),
              routeInformationParser: _appRouter.defaultRouteParser(),
              builder: (ctx, child) {
                return FlutterEasyLoading(child: child); //do something
              });
        },
      ),
    );
  }
}
