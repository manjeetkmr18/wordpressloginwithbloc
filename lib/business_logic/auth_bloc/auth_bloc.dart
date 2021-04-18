import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordpress_bloc/data/api_services.dart';
import 'package:wordpress_bloc/data/shred_pref.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  Shared shared = Shared();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if (event is Authinit) {
        yield* _mapAuthinitToState();
      } else if (event is LoggedIn) {
        yield* _mapAuthLoggedInToState();
      } else if (event is LoggedOut) {
        yield* _mapAuthLoggedOutInToState();
      }
    } catch (e) {
      yield AuthFailure(e.toString());
    }
  }

  Stream<AuthState> _mapAuthinitToState() async* {
    try {
      String token = await shared.getToken();
      if (token != null) {
        yield Authenticated();
      } else {
        yield UnAuthenticated();
      }
      } 
      catch (e) {
        yield AuthFailure(e.toString());
      }
  }

  Stream<AuthState> _mapAuthLoggedInToState() async* {
    final uid = await shared.getSaved();
    final token = await shared.getToken();
    yield Authenticated();
  }

  Stream<AuthState> _mapAuthLoggedOutInToState() async* {
    yield UnAuthenticated();
  }
}
