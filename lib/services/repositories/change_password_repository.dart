import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_stud/services/api_service.dart';

class ChangePasswordRepository {

  Future<Map<String,dynamic>> forgetPassword(String email) async {
    try {
      print('object');
      var response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/forgot-password/'),
        // UserService.forgetUrl,
        body: {
          'email': email,
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
      print(e);
      return {
        'success':false,
        'data': 'Server errors '
      };
    }
  }
  Future<Map<String,dynamic>> restPassword(String email,String code, String password) async {
    try {
      var response = await http.post(
        UserService.restUrl,
        body: {
          'email': email,
          'code': code,
          'new_password': password,
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
      // print(e);
      return {
        'success':false,
        'data': 'Server errors'
      };
    }
  }
}