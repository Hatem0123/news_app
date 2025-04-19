import 'package:dio/dio.dart';

class Dio_helper{



  static Dio? dio ;




  static init(){
    dio = Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,

          baseUrl: 'https://newsapi.org/v2/',


        )

    );


  }




static Future GET_news({url,dynamic query}) async {

      Response? response = await dio?.get(url,queryParameters:query);
      if(response?.statusCode == 200){

        return response?.data;

      }else{

        throw Exception('there is a problem with status code ${response?.statusCode.toString()}');
      }



}


Future getNews()async{

  var response =await dio!.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=05990b2b657945a3811a7e82543c5421');

  var data =await response;

  print(data.toString());


  return data;
}













}