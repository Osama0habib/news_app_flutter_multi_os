import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mansour/layout/cubit/states.dart';
import 'package:news_app_mansour/modules/business/Business_screen.dart';
import 'package:news_app_mansour/modules/science/science_screen.dart';
import 'package:news_app_mansour/modules/sports/sports_screen.dart';
import 'package:news_app_mansour/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.business),label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),

  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;

    switch(index) {
      case 0 :
        {
          getBusiness();
        }
        break;
      case 1 :
        {
          getSports();
        }
        break;
      case 2 :
        {
          getScience();
        }
        break;
    }


    emit(NewsBottomNavState());
  }

  var business = [];

  void getBusiness()
  {
    emit(NewsLoadingState());
    business.isEmpty?
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'e8913848eb0a4dcdbb4293e436fb0f8f'
        }).then((value) {
      print(value.data['articles']);
      business = value.data['articles'];
      //print(business[0]['titles']);
      emit(NewsGetBusinessSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorsState(error.toString()));

    } ):
    emit(NewsGetBusinessSuccessState());

  }

  var sports = [];

  void getSports()
  {
    emit(NewsLoadingState());
    sports.isEmpty?
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'e8913848eb0a4dcdbb4293e436fb0f8f'
        }).then((value) {
      print(value.data['articles']);
      sports = value.data['articles'];
      //print(business[0]['titles']);
      emit(NewsGetSportsSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorsState(error.toString()));

    } ): emit(NewsGetSportsSuccessState());

  }

  var science = [];

  void getScience()
  {
    emit(NewsLoadingState());
    science.isEmpty?
    DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'e8913848eb0a4dcdbb4293e436fb0f8f'
        }).then((value) {
      print(value.data['articles']);
      science = value.data['articles'];
      //print(business[0]['titles']);
      emit(NewsGetScienceSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorsState(error.toString()));

    } ): emit(NewsGetScienceSuccessState());

  }

  var search = [];

  void getSearch(String val)
  {
    emit(NewsLoadingState());
      DioHelper.getData(url: 'v2/everything',
        query: {

          'q': val,
          'apiKey': 'e8913848eb0a4dcdbb4293e436fb0f8f'
        }).then((value) {
      print(value.data['articles']);
      search = value.data['articles'];
      //print(business[0]['titles']);
      emit(NewsGetSearchSuccessState());

    }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorsState(error.toString()));

    } );

  }
}