import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdmc_project/features/profile/logic/profile_cubit.dart';
import 'core/dependancy_injection/injection.dart';
import 'core/network/local/cache/cache_helper.dart';
import 'core/network/remote/apis/dio_helper.dart';
import 'core/network/remote/firebase/firebase_messaging.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_locales.dart';
import 'core/utils/bloc_observer.dart';
import 'features/splash/presentation/splash_screen.dart';

var navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// SHARED PREFERENCES INIT
  await CacheHelper.init();

  /// screen util
  await ScreenUtil.ensureScreenSize();

  /// Firebase
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBuGQLReQbS-aDx3M3qGxOg2leVCERLjM0',
        appId:Platform.isAndroid?
        '1:44043735913:android:19e778be5a1dc5d6bce3f8'
            :"1:44043735913:ios:a3f92a3e377310eabce3f8",
        messagingSenderId: '44043735913',
        projectId: 'tdmc-5d126',
        storageBucket: 'tdmc-5d126.appspot.com',
        iosBundleId: 'com.tdmc.emerging',
      ),
  );

  await FirebaseNotifications.init();


  /// GET IT
  GetItService.setupGitIt();

  /// API INIT [DIO]
  DioHelper.init();

  /// LANGUAGE INIT
  await EasyLocalization.ensureInitialized();
  await AppLocales.init();

  /// SET DISABLE AUTO ROTATE
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// BLOC OBSERVER
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) =>
        EasyLocalization(
            path: AppLocales.path,
            supportedLocales: AppLocales.supportedLocales,
            startLocale: AppLocales.currentLocale,
            fallbackLocale: AppLocales.currentLocale,
            child: MyApp()),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(365, 812),
      child: BlocProvider(
        create: (context) => getIt<ProfileCubit>()
          ..getProfileData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          /*locale: Locale('en'),
          localizationsDelegates: [
            CountryLocalizations.delegate,
          ],*/
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldColor,
            colorScheme: const ColorScheme.light(
                primary: AppColors.primaryColor),
            useMaterial3: true,
            fontFamily: 'Inter',
          ),
          navigatorKey:navigatorKey,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}

