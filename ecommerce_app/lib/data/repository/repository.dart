
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/check_internet.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart'as http;


class ApiRepository{

  Future<Either<StatusRequest, dynamic>> getData(String link) async  {
    try{
      if (await checkInternet()) {
        print(link);
        var response = await http.get(Uri.parse(link),).timeout(Duration(seconds: 15));
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.statusCode);
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
        else {
          return const Left(StatusRequest.SERVER_FAILURE);
        }
      }

      else {
        return const Left(StatusRequest.OFFLINE_FAILURE);
      }
    } catch(e)  {
      return const Left(StatusRequest.SERVER_FAILURE);
    }
  }

  Future<Either<StatusRequest, dynamic>> postData(String linkUrl, Map map) async {

    try{

      if (await checkInternet()) {

        var response = await http.post(
            Uri.parse(linkUrl),
            body: jsonEncode(map),
            headers: {'Content-Type': 'application/json'}).timeout(Duration(seconds: 15));

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.statusCode);
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
        else {
          return const Left(StatusRequest.SERVER_FAILURE);
        }
      }

    else {
      return const Left(StatusRequest.OFFLINE_FAILURE);
    }
  } catch(e)  {
    print(e.toString());
    return const Left(StatusRequest.OFFLINE_FAILURE);


    }
  }

  Future<Either<StatusRequest, dynamic>> putData(String linkUrl, Map map) async {

    try{
      if (await checkInternet()) {

        var response = await http.put(
            Uri.parse(linkUrl),
            body: jsonEncode(map),
            headers: {'Content-Type': 'application/json'});

        if ((response.statusCode == 200 || response.statusCode == 201)) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
        else {
          return const Left(StatusRequest.SERVER_FAILURE);
        }
      }
      else {
        return const Left(StatusRequest.OFFLINE_FAILURE);
      }
    }on TimeoutException{
      return const Left(StatusRequest.TIME_OUT_FAILURE);
    }
  }




  Future<Either<StatusRequest, dynamic>> deleteData(String linkUrl, Map map) async {
    try{
      if (await checkInternet()) {

        var response = await http.delete(
            Uri.parse(linkUrl),
            body: jsonEncode(map),
            headers: {'Content-Type': 'application/json'});

        if ((response.statusCode == 200 || response.statusCode == 201)) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
        else {
          return const Left(StatusRequest.SERVER_FAILURE);
        }
      }
      else {
        return const Left(StatusRequest.OFFLINE_FAILURE);
      }
    }catch(e){
      return const Left(StatusRequest.SERVER_FAILURE);
    }
  }

}