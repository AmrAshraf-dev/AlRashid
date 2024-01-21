import 'dart:async';

import 'package:alrashid_mall_app/api/controllers/err_controller.dart';
//import 'package:alrashid_mall_app/app.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/home_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_notification.dart';
import 'package:alrashid_mall_app/locale/language_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// void main() async {
//   ///
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
//   await configureDependencies();
//   GlobalNotification().setupNotification();
//   //GlobalNotification().setupNotification();
//   ERRController.exitFromAppWhileUnExpectedErr();
//   runZonedGuarded(
//     () async {
//       await ERRController.initSentry();
//       runApp(MultiBlocProvider(providers: [
//         BlocProvider.value(value: LanguageCubit("en")),
//         //  BlocProvider.value(value: HomeCubit()),
//       ], child: const MyApp()));
//     },
//     (exception, stackTrace) async {
//       await ERRController.sentryErrCapture(exception, stackTrace: stackTrace);
//     },
//   );

//   //return
//   // BlocProvider(
//   //   create: (context) => LanguageFormBloc(),
//   //   child: BlocBuilder<LanguageFormBloc, LanguageFormState>(
//   //     builder: (context, state) {
//   //       return MaterialApp(
//   //         debugShowCheckedModeBanner: false,
//   //         title: 'Flutter Demo',
//   //         locale: state.selectedLocale,
//   //         supportedLocales: L10n.all,
//   //         localizationsDelegates: const [
//   //           GlobalMaterialLocalizations.delegate,
//   //           GlobalWidgetsLocalizations.delegate,
//   //           GlobalCupertinoLocalizations.delegate,
//   //         ],
//   //         theme: ThemeData(
//   //           primarySwatch: Colors.blue,
//   //         ),
//   //         // supportedLocales: L10n.all,
//   //         home: const Splash(),
//   //       );
//   //     },
//   //   ),
//   // );
// }

import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_notification.dart';
import 'package:alrashid_mall_app/employee_files/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await configureDependencies();
  GlobalNotification().setupNotification();
  // getIt<GlobalNotification>().setupNotification();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: LanguageCubit("en")),
        BlocProvider.value(value: HomeCubit()),
      ],
      child: BlocProvider(
        create: (BuildContext context) => LangCubit(),
        child: Phoenix(child: const MyApp()),
      ),
    ),
    // BlocProvider(
    //   create: (BuildContext context) => LangCubit(),
    //   child: Phoenix(child: const MyApp()),
    // ),
  );
}
