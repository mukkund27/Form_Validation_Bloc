import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Bloc/SigninEvent.dart';
import 'package:form_validation_bloc/Bloc/SigninState.dart';

class SigninBloc extends Bloc<SignInEvent, SigninState> {
  SigninBloc() : super(SigninInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (!EmailValidator.validate(event.emailValue)) {
        emit(SigninErrorState("Please Enter Valid Email"));
      } else if (event.passwordValue.length <= 7) {
        emit(SigninErrorState("Please Enter Valid Password"));
      } else {
        emit(SigninValidState());
      }
    });

    on<SigninSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
