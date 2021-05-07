import 'package:equatable/equatable.dart';

abstract class AuthState {}
//@override
//extends Equatable
// List<Object> get props => [];}

class LoginInitialState extends AuthState {}

class InitState extends AuthState {
  final int c = 0;
  InitState({c});
}

class CountingState extends AuthState {
  int c;
  CountingState({this.c});
}

class LoginLoadingState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class AdminLoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;
  LoginErrorState({this.message});
}
class ContactState extends AuthState {
  List contact =[];
  ContactState({this.contact});
}
