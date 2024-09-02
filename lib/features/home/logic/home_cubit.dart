import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tdmc_project/features/layout/presentation/screens/layout_screen.dart';
import '../../../core/utils/app_navigation.dart';
import '../../../core/utils/helper/app_dialogs.dart';
import '../../../core/utils/helper/app_helper.dart';
import '../data/models/workshops_model.dart';
import '../data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  HomeRepo repo;

  static HomeCubit get(context) => BlocProvider.of(context);

  final searchController = TextEditingController();

  /// get Work Shops
  WorkShopsModel? workShopsModel;
  void getWorkShops() async {
    emit(Loading());
    await repo.getWorkShops().then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        workShopsModel = r;
        emit(Success());
      });
    });
  }

  int tabBarIndex = 0;
  onChangeTabBarIndex(int index, String error){
    tabBarIndex = index;
    searchList = [];
    if (workShopsModel != null) {
      emit(Success());
    } else {
      emit(Error(error));
    }
  }

  onControllerEmpty(){
    searchList.clear();
    AppHelper.closeKeyboard();
    emit(Success());
  }

  /// search
  List<Result> searchList = [];
  searchWorkshops(String query, String error){
    searchList = [];
    bool isFound = false;
    if (workShopsModel != null) {
      if(query.isEmpty){
        onControllerEmpty();
        return ;
      }
      final text = query.toLowerCase();
      if (tabBarIndex == 0) {
        workShopsModel!.enrolledWorkshops.forEach((e){
          if((e.topicName?.toLowerCase().contains(text)??false) ||
              (e.companyName?.toLowerCase().contains(text)??false) ||
              (e.venueName?.toLowerCase().contains(text)??false)
          ){
            searchList.add(e);
            isFound=true;
          }
        });
        if(isFound==true){
          emit(SearchSuccess());
        }else{
          emit(SearchError('No search result'));
        }
      }
      else if (tabBarIndex == 1) {
        workShopsModel!.completedWorkshops.forEach((item){
          if ((item.venueName?.toLowerCase().contains(text)??false) ||
              (item.companyName?.toLowerCase().contains(text)??false) ||
              (item.topicName?.toLowerCase().contains(text)??false)
          ) {
             searchList.add(item);
             isFound = true ;
          }
        });
        if(isFound==true){
          emit(SearchSuccess());
        }else{
          emit(SearchError('No search result'));
        }
      } if(tabBarIndex == 2) {
        workShopsModel!.upcomingWorkshops.forEach((e) {
          if ((e.topicName?.toLowerCase().contains(text)??false) ||
              (e.companyName?.toLowerCase().contains(text)??false) ||
              (e.venueName?.toLowerCase().contains(text)??false)
          ) {
            searchList.add(e);
            isFound=true;
          }
        });
        if(isFound==true){
          emit(SearchSuccess());
        }else{
          emit(SearchError('No search result'));
        }
      }else {
        workShopsModel!.invitedWorkshops.forEach((e) {
          if ((e.topicName?.toLowerCase().contains(text)??false) ||
              (e.companyName?.toLowerCase().contains(text)??false) ||
              (e.venueName?.toLowerCase().contains(text)??false)
          ) {
            searchList.add(e);
            isFound=true;
          }
        });
        if(isFound==true){
          emit(SearchSuccess());
        }else{
          emit(SearchError('No search result'));
        }
      }
    } else {
      emit(Error(error));
    }
  }

  clearSearch() {
    searchList = [];
    searchController.clear();
    AppHelper.closeKeyboard();
    if (workShopsModel != null) {
      emit(Success());
    }
  }

  /// withdraw
  void withdraw(context,{required String id}) async {
    emit(Loading());
    await repo.withdraw(id).then((value) {
      value.fold((l) {
        AppDialogs.toast(
          msg: l.message,
          state: ToastStates.error,
        );
        emit(Error(l.message));
      }, (r) {
        AppNavigator.pushAndRemove(
            screen: LayoutScreen(),
            context: context);
        emit(Success());
      });
    });
  }

  //////////////////////////////////////////
  ///calendar search
  List<Result> searchResults = [];
  void _searchInList(List<Result> workshops,DateTime selectedDay) {
    for (Result workshop in workshops) {
      final start = DateFormat("yyyy-MM-dd").parse(workshop.fromDate!);
      final end = DateFormat("yyyy-MM-dd").parse(workshop.toDate!);

      // Check if the selected day is within the workshop date range
      if ((selectedDay.isAfter(start) && selectedDay.isBefore(end.add(Duration(days: 1))))) {
        searchResults.add(workshop);
      }
    }
  }
  void searchWorkshopsByDate(DateTime selectedDay,) {
     searchResults = [];
   if(workShopsModel !=null){
     // Search in completed workshops
     if(workShopsModel!.completedWorkshops.isNotEmpty){
       _searchInList(workShopsModel!.completedWorkshops,selectedDay);
     }
     // Search in enrolled workshops
     if(workShopsModel!.enrolledWorkshops.isNotEmpty){
       _searchInList(workShopsModel!.enrolledWorkshops,selectedDay);
     }
     // Search in upcoming workshops
     if(workShopsModel!.upcomingWorkshops.isNotEmpty){
       _searchInList(workShopsModel!.upcomingWorkshops,selectedDay);
     }
     emit(Success());
   }
  }


}
