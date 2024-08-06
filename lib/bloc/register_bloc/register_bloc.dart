import 'package:bloc/bloc.dart';
import 'package:wallet/data/repositories/auth_repository.dart';
import 'package:wallet/data/responses/my_response.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoginRepository _loginRepository;

  RegisterBloc(this._loginRepository) : super(RegisterInitial()) {
    on<RegisterUserEvent>(_onRegister);
  }

  Future<void> _onRegister(RegisterUserEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    final MyResponse response = await _loginRepository.walletRegister(
      username: event.username,
      password: event.password,
      name: event.name,
      surname: event.surname,
    );
    if (response.errorMessage.isEmpty) {
      emit(const RegisterSuccess(message: 'Registration successful!'));
    } else {
      emit(RegisterFailure(error: response.errorMessage));
    }
  }
}
