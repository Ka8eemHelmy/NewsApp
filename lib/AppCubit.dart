import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/AppNewsApi.dart';
import 'package:news_app/AppStates.dart';
import 'package:news_app/BussinessScreen.dart';
import 'package:news_app/ScienceScreen.dart';
import 'package:news_app/SportsScreen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [BussinessScreen(), SportsScreen(), ScienceScreen()];

  List<String> tittleAppBar = ["Business", "Sports", "Science"];

  List<IconData> iconAppBar = [
    Icons.business_center,
    Icons.sports_baseball,
    Icons.science_outlined
  ];

  List <dynamic> businessList = [];
  List <dynamic> sportsList = [];
  List <dynamic> scienceList = [];

  void bottomNavigationIndexChange(int index) {
    currentIndex = index;
    emit(AppNavigatorIndexChang());
    if(currentIndex==0){
      getBusinessData();
    }else if(currentIndex == 1){
      getSportsData();
    }else{
      getScienceData();
    }
  }

  void getBusinessData() {
    emit(AppGetDataLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      //'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6'
      'apiKey': 'dba90520a2b243ffaaa8296d5b973d47'
    }).then((value) {
      businessList = value.data['articles'];
      emit(AppGetDataSuccess());
      print(businessList.toString());
    }).catchError((error) {
      print('Error is $error');
      emit(AppGetDataError(error.toString()));
    });
  }

  void getSportsData() {
    emit(AppGetDataLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      //'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6'
      'apiKey': 'dba90520a2b243ffaaa8296d5b973d47'
    }).then((value) {
      sportsList = value.data['articles'];
      emit(AppGetDataSuccess());
      print(sportsList.toString());
    }).catchError((error) {
      print('Error is $error');
      emit(AppGetDataError(error.toString()));
    });
  }

  void getScienceData() {
    emit(AppGetDataLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      //'apiKey': '21ec5da562414c9e9fb0525d87dbb2e6'
      'apiKey': 'dba90520a2b243ffaaa8296d5b973d47'
    }).then((value) {
      scienceList = value.data['articles'];
      emit(AppGetDataSuccess());
      print(scienceList.toString());
    }).catchError((error) {
      print('Error is $error');
      emit(AppGetDataError(error.toString()));
    });
  }
}
