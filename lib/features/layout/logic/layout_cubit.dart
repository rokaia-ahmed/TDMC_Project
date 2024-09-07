import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_images.dart';
import '../../calendar/presentation/screens/calender_screen.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../profile/presentation/screens/profile_screen.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  List<String> icons=[
    AppIcons.home,
    AppIcons.calender,
    AppIcons.profile,
  ];

  List<Widget> Screens=[
    HomeScreen(),
    CalenderScreen(),
    ProfileScreen(),
  ];
  int activeIndex = 0 ;
  changeNavbarIndex(int index){
    activeIndex = index ;
    emit(LayoutInitial());
  }
}
