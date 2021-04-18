import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordpress_bloc/data/api_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiService _apiService = ApiService();

  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSubmitted) {
      yield LoginLoading();
      try {
        print(event.email);
        print(event.password);
        var data = await _apiService.authentication(
            username: event.email, password: event.password);
        if (data != null) {
          yield LoginSucessFull();
        } else {
          yield LoginFailure();
        }
      } catch (e) {
        yield LoginFailure();
      }
    }
  }
}
