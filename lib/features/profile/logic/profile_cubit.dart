import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdmc_project/features/profile/data/models/profile_model.dart';
import 'package:tdmc_project/features/profile/data/repos/profile_repo.dart';

import '../../../core/network/local/cache/cache_helper.dart';
import '../../../core/utils/app_locales.dart';
import '../../../core/utils/app_navigation.dart';
import '../../layout/presentation/screens/layout_screen.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repo) : super(ProfileInitial());

  ProfileRepo repo ;
 static ProfileCubit get(context)=>BlocProvider.of(context);

   /// change language
  Future changeLanguage(context, String lang,ProfileState state) async {
    await CacheHelper.saveData('lang', lang).then((value) async {
      AppLocales.setDeviceLocale(context, lang == 'ar' ? 0 : 1);
      AppNavigator.pushAndRemove(
          screen: const LayoutScreen(),
          context: context);
    });
      emit(ChangeLanguageState());
  }

  /// get profile data
  ProfileModel? profileModel;
  void getProfileData() async {
    emit(Loading());
    await repo.getWorkShops().then((value) {
      value.fold((l) {
        debugPrint(l.message);
        emit(Error(l.message));
      }, (r) {
        profileModel = r;
        emit(Success());
      });
    });
  }

  /// switch ar or en
  String language = CacheHelper.getData('lang') ;
   languageSwitch(String lang,state){
     language =lang ;
     emit(LanguageSwitched());
   }

}
