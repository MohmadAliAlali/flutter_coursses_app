// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_stud/repositories/user_repository.dart';
// import 'login_event.dart';
// import 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//
//   LoginBloc() : super(LoginInitial()) {
//     on<LoginSubmitted>(_onLoginSubmitted);
//   }
//
//   // This method handles the LoginSubmitted event
//   Future<void> _onLoginSubmitted(
//       LoginSubmitted event, Emitter<LoginState> emit) async {
//     emit(LoginLoading());
//     try {
//       var user = await UserRepository.loginFun(event.email, event.password);
//       if (user != null) {
//         emit(LoginSuccess());
//       } else {
//         emit(LoginFailure('Invalid credentials'));
//       }
//     } catch (e) {
//       emit(LoginFailure(e.toString()));
//     }
//   }
// }