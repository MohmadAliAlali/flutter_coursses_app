
class ApiService {
  // static const String baseUrl = "http://192.168.1.8:8000/";
  // static const String baseUrl = "http://10.42.0.203:8000/";
  // static const String baseUrl = "http://10.98.0.37:8000/";
  // static const String baseUrl = "http://192.168.122.1:8000/";
  static const String baseUrl = "http://127.0.0.1:8000/";

}

class UserService {
  // Auth URLs
  static Uri loginUrl = Uri.parse('${ApiService.baseUrl}api/token/');
  static Uri registerUrl = Uri.parse("${ApiService.baseUrl}api/register/");
  static Uri refreshTokenUrl = Uri.parse("${ApiService.baseUrl}api/token/refresh/");
  static Uri confirmUrl = Uri.parse("${ApiService.baseUrl}api/verify-otp/");
  static Uri setInfoUrl = Uri.parse("${ApiService.baseUrl}api/update-user-info/");
  static Uri resendConfirmUrl = Uri.parse("${ApiService.baseUrl}api/send-verification-email/");
  static Uri forgetUrl = Uri.parse("${ApiService.baseUrl}api/forgot-password/");
  static Uri restUrl = Uri.parse("${ApiService.baseUrl}api/reset-password/");
//   Subject URL s
  static Uri subjectListUrl = Uri.parse("${ApiService.baseUrl}subjects/");
}