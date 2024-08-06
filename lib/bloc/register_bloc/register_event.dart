part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String username;
  final String password;
  final String name;
  final String surname;

  const RegisterUserEvent({
    required this.username,
    required this.password,
    required this.name,
    required this.surname,
  });

  @override
  List<Object> get props => [username, password, name, surname];
}
