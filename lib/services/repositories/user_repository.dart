import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_stud/services/api_service.dart';

class UserRepository {

  Future<Map<String,dynamic>> loginFun(String email, String password) async {
    try {
      var response = await http.post(
        UserService.loginUrl,
        body: {
          'username': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return {
          'success':true,
          'data': jsonDecode(response.body)
        };
      } else {
        return {
          'success':false,
          'data': jsonDecode(response.body)['error'] ??'Unknown error'
        };
      }
    }catch (e){
      return {
        'success':false,
        'data': 'Unknown error'
      };
    }
  }

  Future<Map<String,dynamic>> register(String name, String email, String password,String password2) async {
    // final Uri url = Uri.parse('http://127.0.0.1:8000/api/token/');

    final response = await http.post(
      UserService.registerUrl,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': name,
        'email': email ,
        'password': password,
        'password2':password2
      },
    );

    if (response.statusCode == 201) {
      return {
        'success':true,
        'data': jsonDecode(response.body)
      };
    } else {
      return {
        'success':false,
        'data': jsonDecode(response.body) ??'Unknown error'
      };
    }
  }


}