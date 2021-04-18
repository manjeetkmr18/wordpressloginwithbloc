part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState{}

class RegisterSucessFull extends RegisterState{
}
class RegisterFailure extends RegisterState{}