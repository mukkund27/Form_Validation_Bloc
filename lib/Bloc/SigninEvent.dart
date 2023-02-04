abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangeEvent(this.emailValue, this.passwordValue);
}

class SigninSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SigninSubmittedEvent(this.email, this.password);
}
