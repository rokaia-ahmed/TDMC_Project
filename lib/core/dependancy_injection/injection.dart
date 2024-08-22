import 'package:get_it/get_it.dart';
import 'package:tdmc_project/features/home/data/repos/home_repo.dart';
import 'package:tdmc_project/features/home/logic/home_cubit.dart';

import '../../features/Auth/data/repos/auth_repo.dart';
import '../../features/Auth/logic/auth_cubit.dart';


 final GetIt getIt = GetIt.instance;
class GetItService{

 static Future setupGitIt()async{
      // auth
     getIt.registerLazySingleton<AuthRepo>(()=>AuthRepo());
     getIt.registerFactory<AuthCubit>(()=>AuthCubit(getIt()));

     // home
     getIt.registerLazySingleton<HomeRepo>(()=>HomeRepo());
     getIt.registerFactory<HomeCubit>(()=>HomeCubit(getIt()));
 }
}
