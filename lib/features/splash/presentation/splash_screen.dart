import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdmc_project/core/network/local/cache/cache_helper.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_navigation.dart';
import 'package:tdmc_project/features/Auth/presentation/screens/login_screen.dart';
import 'package:tdmc_project/features/layout/presentation/screens/layout_screen.dart';

import '../../../core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 13),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();

    navigateTo(context);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context, _) => SlideTransition(
                position: slidingAnimation,
                child:SvgPicture.asset(AppSvg.splash),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(context){
    Future.delayed(const Duration(seconds:5),
          (){
        if(CacheHelper.getData('token') !=null){
          AppNavigator.pushAndRemove(screen: const LayoutScreen(),
              context: context);
        }else{
          AppNavigator.pushAndRemove(screen: const LoginScreen(),
              context: context);
        }
      },
    );
  }
}
