abstract class SigninState {}

class SigninInitialState extends SigninState {}

class SigninValidState extends SigninState {}

class SigninErrorState extends SigninState {
  final String errorMessage;
  SigninErrorState(this.errorMessage);
}

class SignInLoadingState extends SigninState {}
