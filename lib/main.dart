import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/dependancy_injection/injection.dart';
import 'core/network/local/cache/cache_helper.dart';
import 'core/network/remote/apis/dio_helper.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/bloc_observer.dart';
import 'features/splash/presentation/splash_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  /// SHARED PREFERENCES INIT
  await CacheHelper.init();

  /// screen util
  await ScreenUtil.ensureScreenSize();

  /// GET IT
  GetItService.setupGitIt();

  /// API INIT [DIO]
  DioHelper.init();

  /// SET DISABLE AUTO ROTATE
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// BLOC OBSERVER
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(365, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor:AppColors.white,
          colorScheme:const ColorScheme.light(primary: AppColors.primaryColor),
          useMaterial3: true,
          fontFamily: 'Plus Jakarta Sans',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

