
class ApiService {
  static const String baseUrl = "http://10.42.0.203:8000/";
}

class UserService {
  static Uri loginUrl = Uri.parse('${ApiService.baseUrl}api/token/');
  static Uri registerUrl = Uri.parse("${ApiService.baseUrl}register/");
  static Uri refreshTokenUrl = Uri.parse("${ApiService.baseUrl}api/token/refresh/");
}