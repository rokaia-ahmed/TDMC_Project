import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tdmc_project/core/utils/app_images.dart';
import 'package:tdmc_project/features/calender/presentation/screens/calender_screen.dart';
import '../data/repos/home_repo.dart';
import '../presentation/screens/home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  HomeRepo  repo;

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> icons=[
    AppIcons.home,
    AppIcons.calender,
  ];

  List<String> navbarNames=[
    'Home',
    'Calendar',
  ];
  List<Widget> Screens=[
    HomeScreen(),
    CalenderScreen(),
  ];
  int activeIndex = 0 ;
  changeNavbarIndex(int index){
    activeIndex = index ;
    emit(HomeInitial());
  }
}
