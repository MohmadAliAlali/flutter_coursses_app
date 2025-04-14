

import 'package:get/get.dart';
import 'package:project_stud/bindings/confirm_binding.dart';
import 'package:project_stud/bindings/edit_binding.dart';
import 'package:project_stud/bindings/forget_binding.dart';
import 'package:project_stud/bindings/home_binding.dart';
import 'package:project_stud/bindings/login_binding.dart';
import 'package:project_stud/bindings/register_binding.dart';
import 'package:project_stud/bindings/rest_binding.dart';
import 'package:project_stud/ui/screens/auth_screens/confirm_screen/confirm_screen.dart';
import 'package:project_stud/ui/screens/auth_screens/info_set_screen/info_set_screen.dart';
import 'package:project_stud/ui/screens/auth_screens/login_screen/login_screen.dart';
import 'package:project_stud/ui/screens/auth_screens/rigister_screen/register_screen.dart';
import 'package:project_stud/ui/screens/bottom_navbar.dart';
import 'package:project_stud/ui/screens/edit_profile_screen.dart';
import 'package:project_stud/ui/screens/forget_password_screen.dart';
import 'package:project_stud/ui/screens/help_center_screen.dart';
import 'package:project_stud/ui/screens/home_screen.dart';
import 'package:project_stud/ui/screens/intro_screen.dart';
import 'package:project_stud/ui/screens/privacy_policy_screen.dart';
import 'package:project_stud/ui/screens/rest_password_screen.dart';
import 'package:project_stud/ui/screens/splash_screen.dart';

class AppRouts{


  static const String splash = "/splash";
  static const String intro = "/intro";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgetPage = "/forgetPage";
  static const String restPage = "/restPage";
  static const String vitrify = "/vitrify";
  static const String infoPage = "/infoPage";
  static const String navPage = "/navPage";
  static const String policyPage = "/policyPage";
  static const String helpPage = "/helpPage";
  static const String editPage = "/editPage";
  static const String home = "/home";



  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: ()=>const  SplashScreen(),
    ),
    GetPage(
      name: intro,
      page: ()=>const  IntroScreens(),
    ),
    GetPage(
        name: login,
        page: ()=> LoginScreen(),
        binding: LoginBinding()
    ),
    GetPage(
        name: restPage,
        page: ()=> RestPasswordScreen(),
        binding: RestBinding()
    ),
    GetPage(
        name: forgetPage,
        page: ()=> ForgetPasswordScreen(),
        binding: ForgetBinding()
    ),
    GetPage(
        name: register,
        page: ()=> RegisterScreen(),
        binding: RegisterBinding()
    ),
    GetPage(
        name: vitrify,
        page: ()=> ConfirmScreen(),
        binding: ConfirmBinding()
    ),
    GetPage(
        name: infoPage,
        page: ()=> InfoSetScreen(),
        // binding: ConfirmBinding()
    ),
    GetPage(
      name: navPage,
      page: ()=>const BottomNavBarDemo(),
    ),
    GetPage(
        name: home,
        page: ()=> HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: editPage,
      page: ()=> EditProfileScreen(),
        binding: EditBinding()

    ),
    GetPage(
      name: policyPage,
      page: ()=>const  PrivacyPolicyScreen(),
    ),
    GetPage(
      name: helpPage,
      page: ()=> HelpCenterScreen(),

    ),
  ];

}