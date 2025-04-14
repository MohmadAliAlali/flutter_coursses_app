import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_stud/core/helper/state_manager.dart';
import 'package:project_stud/services/api_service.dart';

class InfoRepository {

  Future<Map<String,dynamic>> infoRepo(String university, String specialization,String year) async {
    try {
      var response = await http.post(
        UserService.setInfoUrl,
        headers: {
          'Authorization': 'Bearer ${AppState.accessToken}'
        },
        body: {
          'university' : university,
          'specialization': specialization,
          'year': year,
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