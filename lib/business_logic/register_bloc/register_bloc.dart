import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordpress_bloc/data/api_services.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  ApiService _apiService = ApiService();
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterSubmitted) {
      yield RegisterLoading();
      try {
        String nonce = await _apiService.nonce();
        var data = await _apiService.registration(
            nonce: nonce,
            username: event.email,
            displayName: event.firstname + event.lastname,
            email: event.email,
            password: event.password,
            first_name: event.firstname,
            last_name: event.lastname);
        await _apiService.authentication(
            username: event.email, password: event.password);
        if (data != null) {
          yield RegisterSucessFull();
        }
      } catch (e) {
        yield RegisterFailure();
      }
    }
  }
}
