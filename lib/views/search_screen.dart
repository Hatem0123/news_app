import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww_pr_final/shared/components/components.dart';
import 'package:neww_pr_final/state_mangment/cubit_logic.dart';
import 'package:neww_pr_final/state_mangment/cubit_states.dart';

//https://newsapi.org/v2/everything?q=tesla&apiKey=05990b2b657945a3811a7e82543c5421
class Search_screen extends StatelessWidget {


  Search_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController search_cont = TextEditingController();

    return

      BlocConsumer<App_cubit,App_states>(
        listener: (context,state){},
        builder: (context,state) {

          var list =App_cubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                    child: Default_textformfield(controller: search_cont,
                      type: TextInputType.text,
                      hint_text: 'search',
                      validate: (String? value){
                        if(value!.isEmpty){
                          return ' Search must be not empty';
                        }else{
                          return null;
                        }
                      },
                      on_change: (value){
                        App_cubit.get(context).get_search(value);
                      },
                      prefix: Icons.search,
                    ),
                  ),
                 SizedBox(
                   height: 800,
                   child: ConditionalBuilder(
                     condition: list.isNotEmpty,
                     fallback: (context)=>Center(child: CircularProgressIndicator()),
                     builder: (context)=> ListView.separated(itemBuilder:(context,index)=>Build_article_item(list[index],context),
                         separatorBuilder:(context,index)=>Divider(),
                         itemCount: list.length),
                   ),
                 )
                         // Expanded(child: Center(child:build_category(cubit.search,context))),
              
                ],
              ),
            ),

          );
        },

      );
  }
}
