
class SignInState {
  final String userName;
  final String password;

  SignInState({this.userName = '', this.password = ''});

  bool get isValid => userName.isNotEmpty && password.isNotEmpty;

  SignInState copyWith({String? userName, String? password}) {
    return SignInState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}
