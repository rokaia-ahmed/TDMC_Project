import 'package:get_it/get_it.dart';
import 'package:tdmc_project/features/home/data/repos/home_repo.dart';
import 'package:tdmc_project/features/home/logic/home_cubit.dart';
import 'package:tdmc_project/features/layout/logic/layout_cubit.dart';
import 'package:tdmc_project/features/profile/data/repos/profile_repo.dart';
import 'package:tdmc_project/features/profile/logic/profile_cubit.dart';
import '../../features/Assignments/data/repos/assignments_repo.dart';
import '../../features/Assignments/logic/assignments_cubit.dart';
import '../../features/Auth/data/repos/auth_repo.dart';
import '../../features/Auth/logic/auth_cubit.dart';


final GetIt getIt = GetIt.instance;
class GetItService{

 static Future setupGitIt()async{
      // auth
     getIt.registerLazySingleton<AuthRepo>(()=>AuthRepo());
     getIt.registerFactory<AuthCubit>(()=>AuthCubit(getIt()));

     // layout
     getIt.registerFactory<LayoutCubit>(()=>LayoutCubit());

     // home
     getIt.registerLazySingleton<HomeRepo>(()=>HomeRepo());
     getIt.registerFactory<HomeCubit>(()=>HomeCubit(getIt()));

     // assignments
     getIt.registerLazySingleton<AssignmentsRepo>(()=>AssignmentsRepo());
     getIt.registerFactory<AssignmentsCubit>(()=>AssignmentsCubit(getIt()));

     // profile
     getIt.registerLazySingleton<ProfileRepo>(()=>ProfileRepo());
     getIt.registerFactory<ProfileCubit>(()=>ProfileCubit(getIt()));
 }
}
