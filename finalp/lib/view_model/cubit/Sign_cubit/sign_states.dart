abstract class AppStates{}

class AppInitState implements AppStates{}

class RegisterLoading extends AppStates {}

class RegisterSuccess extends AppStates {
  final String msg;
  RegisterSuccess(this.msg);
}

class RegisterError extends AppStates {
  final String err;
  RegisterError(this.err);
}
class RegisterUserExisted extends AppStates {}
/////////////



