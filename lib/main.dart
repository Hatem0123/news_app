import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww_pr_final/shared/local/cahed_helper.dart';
import 'package:neww_pr_final/shared/network/remote/dio_helper.dart';
import 'package:neww_pr_final/shared/themes/theme.dart';
import 'package:neww_pr_final/state_mangment/cubit_logic.dart';
import 'package:neww_pr_final/state_mangment/cubit_states.dart';
import 'package:neww_pr_final/views/home_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   Dio_helper.init();
 await Cach_helper.init();
 bool? iidark= Cach_helper.get_data(key:'Isdark');

  runApp(MyApp(isDark:iidark));
}

class MyApp extends StatelessWidget {
 const   MyApp({super.key, required this.isDark});
  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> App_cubit()
        ..Get_sports()
        ..Get_science()
        ..Get_bussiness()
        ..Change_app_them_dark(fromshared: isDark),
      child: BlocConsumer<App_cubit,App_states>(
        listener: (context,state){},
        builder: (context,state) {
          var cubit = App_cubit.get(context);
          return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme:ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode:cubit.Isdark? ThemeMode.dark : ThemeMode.light,
                home: HomeScreen(),
              );
        },
      ),
    );
  }
}

