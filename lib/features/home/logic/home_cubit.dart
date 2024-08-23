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
        print('${workShopsModel!.completedWorkshops?[0].link}');
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

  /// search
  List<Result> searchList = [];
  searchWorkshops(String text, String error) {
    searchList = [];
    if (workShopsModel != null) {
      if (tabBarIndex == 0) {
        searchList.addAll(workShopsModel!.enrolledWorkshops!
            .where(
              (e) =>
                  e.fromDate!.contains(text) ||
                  e.companyName!.contains(text) ||
                  e.venueName!.contains(text),
            )
            .toList());
      } else if (tabBarIndex == 1) {
        searchList.addAll(workShopsModel!.completedWorkshops!
            .where(
              (e) =>
                  e.fromDate!.contains(text) ||
                  e.companyName!.contains(text) ||
                  e.venueName!.contains(text),
            )
            .toList());
      } else {
        searchList.addAll(workShopsModel!.upcomingWorkshops!
            .where(
              (e) =>
                  e.fromDate!.contains(text) ||
                  e.companyName!.contains(text) ||
                  e.venueName!.contains(text),
            )
            .toList());
      }
      emit(SearchSuccess());
    } else {
      emit(Error(error));
    }
  }

  clearSearch() {
    searchList = [];
    if (workShopsModel != null) {
      emit(Success());
    }
  }
}
