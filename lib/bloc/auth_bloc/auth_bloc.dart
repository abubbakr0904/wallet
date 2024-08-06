import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallet/data/repositories/auth_repository.dart';
import 'package:wallet/data/responses/my_response.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository _loginRepository;

  AuthBloc(this._loginRepository) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, emit) async {
    emit(AuthLoading());
      final MyResponse response = await _loginRepository.walletLogin(
        username: event.username,
        password: event.password,
      );
      if (response.errorMessage.isEmpty) {
        emit(const AuthSuccess(message: 'Login successful!'));
      } else {
        emit(AuthFailure(error: response.errorMessage));
      }
  }
}
