import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww_pr_final/shared/components/components.dart';
import 'package:neww_pr_final/state_mangment/cubit_logic.dart';
import 'package:neww_pr_final/state_mangment/cubit_states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = App_cubit.get(context).sports_list;
    return BlocConsumer<App_cubit,App_states>(
         listener: (context,state){},
      builder: (context,state){
        return  BlocBuilder<App_cubit,App_states>(
          builder: (context, state)
          {
            if (state is SPorts_Loading_states) {
              return Center(child: CircularProgressIndicator());
            }
            else{
              return ListView.separated(
                  physics:BouncingScrollPhysics(),
                  itemBuilder:(context,index)=>Build_article_item(cubit[index],context) ,
                  separatorBuilder:(context,index)=>Divider(),
                  itemCount: cubit.length);
            }


          } ,);

      },
    );
  }
}
