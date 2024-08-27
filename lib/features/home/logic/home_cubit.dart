import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  onChangeTabBarIndex(int index, String error) {
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
    if (workShopsModel != null) {
      emit(Success());
    }
  }
}
