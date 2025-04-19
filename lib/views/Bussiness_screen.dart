import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww_pr_final/shared/components/components.dart';
import 'package:neww_pr_final/state_mangment/cubit_logic.dart';
import 'package:neww_pr_final/state_mangment/cubit_states.dart';

class BussinessScreen extends StatefulWidget {
  const BussinessScreen({super.key});

  @override
  State<BussinessScreen> createState() => _BussinessScreenState();
}

class _BussinessScreenState extends State<BussinessScreen> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.microtask(() {
  //     App_cubit.get(context).Get_bussiness(); // Make sure this method exists in your cubit
  //   });
  //
  // }



  @override
  Widget build(BuildContext context) {
    var cubit = App_cubit.get(context).busnins_list;

    return BlocBuilder<App_cubit,App_states>(
      builder: (context, state)
      {
          return ListView.separated(
              physics:BouncingScrollPhysics(),
              itemBuilder:(context,index)=>Build_article_item(cubit[index],context) ,
              separatorBuilder:(context,index)=>Divider(),
              itemCount: cubit.length);

      } ,);
  }
}
