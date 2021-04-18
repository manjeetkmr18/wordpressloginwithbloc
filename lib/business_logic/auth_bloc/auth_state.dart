part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);

}

class UnAuthenticated extends AuthState {}
