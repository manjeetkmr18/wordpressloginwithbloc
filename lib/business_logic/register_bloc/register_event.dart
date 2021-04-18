part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String firstname;
  final String lastname;

  RegisterSubmitted(
    this.email, this.password, this.firstname, this.lastname);
}
