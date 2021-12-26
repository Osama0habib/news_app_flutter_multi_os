import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mansour/shared/network/local/cache_helper.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void toggleDarkMode({bool? fromShared}){

    if(fromShared  !=  null) {
      isDark =  fromShared;
      emit(NewsDarkModeState());
    }else{
      isDark = !isDark ;
      CacheHelper.putData(value: isDark , key: 'isDark').then((value) => emit(NewsDarkModeState()));
    }


  }

}

