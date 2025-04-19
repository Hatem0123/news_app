import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neww_pr_final/shared/local/cahed_helper.dart';
import 'package:neww_pr_final/shared/network/remote/dio_helper.dart';
import 'package:neww_pr_final/state_mangment/cubit_states.dart';
import 'package:neww_pr_final/views/Bussiness_screen.dart';
import 'package:neww_pr_final/views/science_screen.dart';
import 'package:neww_pr_final/views/sports_screen.dart';

class App_cubit extends Cubit<App_states>{
  App_cubit() :super(App_init_states());
  int current_index=0;

  List<Widget> screens=[
    BussinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];
  List<String> titles=[
    'Business',
    'Sports',
    'Science'
  ];

  List<BottomNavigationBarItem> bottom_item=[
    BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),

  ];

  var busnins_list=[];
  var sports_list=[];
  var science_list=[];





  static App_cubit get(context)=>BlocProvider.of(context);



void Change_bottom_nav_bar(int index){



current_index =index;
emit(App_bottom_states());
}


void Get_bussiness(){
  emit(Business_Loading_states());
  Dio_helper.GET_news(url:'top-headlines',query: {
    'country':'us',
    'category':'business',
    'apiKey':'05990b2b657945a3811a7e82543c5421'

  }).then((value){
     busnins_list = value['articles'];
     emit(Business_sucess_states());

  }).catchError((err){
    emit(Business_error_states(err: err.toString()));
  });
   print(busnins_list.toString());
}

  void Get_sports(){
    emit(SPorts_Loading_states());
    Dio_helper.GET_news(url:'top-headlines',query: {
      'country':'us',
      'category':'sports',
      'apiKey':'05990b2b657945a3811a7e82543c5421'

    }).then((value){
      sports_list = value['articles'];

      emit(SPorts_sucess_states());




    }).catchError((err){
      emit(SPorts_error_states(err: err.toString()));
    });


  }



  void Get_science(){
    emit(Science_Loading_states());
    Dio_helper.GET_news(url:'top-headlines',query: {
      'country':'us',
      'category':'science',
      'apiKey':'05990b2b657945a3811a7e82543c5421'

    }).then((value){
      science_list = value['articles'];
      emit(Science_sucess_states());

    }).catchError((err){
      emit(Science_error_states(err: err.toString()));
    });

  }



  bool Isdark =false;
  void Change_app_them_dark({bool? fromshared}){
    if(fromshared != null){
      Isdark =fromshared;
    }
    else{
      Isdark = !Isdark;
      Cach_helper.put_data(key:'Isdark',value: Isdark).then((value){
        emit(app_theme_state());
      });
    }


    print(Isdark);



  }






  List<dynamic> search=[];

  void get_search(dynamic data){
    emit(News_Search_loading_state());

    search = [];
    Dio_helper.GET_news(url:'top-headlines',
        query: {
          'q':'$data',
          'apiKey':'05990b2b657945a3811a7e82543c5421',
        }).then((value){

        search = value['articles'];

      emit(News_get_Search_sucess_state());
    }).catchError((err){
      print(err);
      emit(News_get_Search_error_state(err.toString()));
    });







  }


}