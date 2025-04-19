import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData Custome_App_theme()=>ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness:Brightness.dark,

        )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedItemColor:Colors.orange ,
    )

);


ThemeData? Custome_Dark_App_theme()=>ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness:Brightness.light,

        )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedItemColor:Colors.orange ,
    )

);
ThemeData? Custome_Dark_App_themee()=>ThemeData(

    appBarTheme:AppBarTheme(
      titleTextStyle: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color:Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Colors.black26,statusBarIconBrightness:Brightness.light ),
      backgroundColor: Colors.black26,
      elevation: 0.0,

    ),



    scaffoldBackgroundColor: Colors.black26,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor:Colors.cyan,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black26,
      elevation: 10,
    ),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.white)
    )
);

