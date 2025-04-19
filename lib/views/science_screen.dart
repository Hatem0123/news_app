import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../state_mangment/cubit_logic.dart';
import '../state_mangment/cubit_states.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({super.key});

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = App_cubit.get(context).science_list;
    return  BlocConsumer<App_cubit,App_states>(
        listener: (context,state){},
        builder:(context,state) {
          return BlocBuilder<App_cubit,App_states>(
            builder: (context, state)
            {
              if (state is Science_Loading_states) {
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
        }
    );
  }
}
