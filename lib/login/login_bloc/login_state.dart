part of 'login_cubit.dart';



abstract class LoginState extends Equatable {
  final Username username;
  final Email email;
  final Password password;
  final FormzStatus status;

  const LoginState({
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  @override
  List<Object> get props;

  LoginState copyWith({
    Username? username,
    Email? email,
    Password? password,
    FormzStatus? status,
  });
}

class SignInState extends LoginState {
  const SignInState({
    super.username = const Username.dirty(""),
    super.email,
    super.password,
    super.status,
  });


  @override
  List<Object> get props => [email, password, status];

  @override
  SignInState copyWith({
    Username? username,
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}


class SignUpState extends LoginState {
  const SignUpState({
    super.username,
    super.email,
    super.password,
    super.status,
  });



  @override
  List<Object> get props => [username, email, password, status];

  @override
  SignUpState copyWith({
    Username? username,
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
