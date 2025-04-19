import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww_pr_final/shared/components/components.dart';
import 'package:neww_pr_final/shared/network/remote/dio_helper.dart';
import 'package:neww_pr_final/state_mangment/cubit_logic.dart';
import 'package:neww_pr_final/state_mangment/cubit_states.dart';
import 'package:neww_pr_final/views/Bussiness_screen.dart';
import 'package:neww_pr_final/views/search_screen.dart';
import 'package:neww_pr_final/views/sports_screen.dart';
import 'package:neww_pr_final/views/science_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // Create_database();
    super.initState();


  }



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<App_cubit,App_states>(
      listener: (context,state){},
      builder: (context,state) {
        var cubit = App_cubit.get(context);
        return Scaffold(
        appBar: Custom_app_bar(Text(cubit.titles[cubit.current_index]),
            [IconButton(onPressed: (){
              Navigationito(context,Search_screen());
            }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
             cubit.Change_app_them_dark();
              }, icon: Icon(Icons.dark_mode))]),
        bottomNavigationBar:Custome_bottom_nav_bar(index:cubit.current_index,
        items: cubit.bottom_item,
          ontap: (index)=> cubit.Change_bottom_nav_bar(index)
        ),
        body: cubit.screens[cubit.current_index],
      );
      },
    );
  }




}
