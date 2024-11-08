// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'authentication_event.dart';
// import 'authentication_state.dart';
//
// class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final UserRepository userRepository;
//
//   AuthenticationBloc({required this.userRepository}) : super(AuthenticationInitial());
//
//   @override
//   Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
//     if (event is AuthenticationStarted) {
//       yield AuthenticationLoading();
//       try {
//         final user = await userRepository.getUser();
//         if (user != null) {
//           yield AuthenticationSuccess(user: user);
//         } else {
//           yield AuthenticationFailure();
//         }
//       } catch (_) {
//         yield AuthenticationFailure();
//       }
//     }
//   }
// }