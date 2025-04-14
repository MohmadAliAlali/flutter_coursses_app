import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_stud/services/api_service.dart';

class ConfirmRepository {

  Future<Map<String,dynamic>> confirmCode(String email, String verificationCode) async {
    try {
      var response = await http.post(
        UserService.confirmUrl,
        body: {
          'email': email,
          'code': verificationCode,
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
        'data': 'Server errors'
      };
    }
  }
  Future<Map<String,dynamic>> resendCode(String email) async {
    try {
      var response = await http.post(
        UserService.resendConfirmUrl,
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
      return {
        'success':false,
        'data': 'Server errors'
      };
    }
  }
}