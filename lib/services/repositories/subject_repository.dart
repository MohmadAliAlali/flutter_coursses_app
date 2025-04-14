import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_stud/model/subject_model.dart';
import 'package:project_stud/services/api_service.dart';

class SubjectRepository {
  Future<Map<String, dynamic>> subjectList() async {
    try {
      final response = await http.get(
        UserService.subjectListUrl,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<Subject> subjects = jsonData
            .map((json) => Subject.fromJson(json))
            .toList();

        return {
          'success': true,
          'data': subjects,
        };
      } else {
        return {
          'success': false,
          'error': 'Failed to load subjects. Status code: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to load subjects: ${e.toString()}',
      };
    }
  }
}