import 'package:shared_preferences/shared_preferences.dart';

class Cach_helper{

  static SharedPreferences? sharedPreferences;



  static init()async{
    sharedPreferences= await SharedPreferences.getInstance();

  }


  static Future<bool> put_data ({String? key,bool? value})async{

   return await sharedPreferences!.setBool(key!, value!);

}



 static bool? get_data ({String? key}){

    return  sharedPreferences!.getBool(key!);

  }


}