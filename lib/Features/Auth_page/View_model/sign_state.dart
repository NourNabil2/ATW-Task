part of 'sign_cubit.dart';

sealed class SignState {}

final class SignInitial extends SignState {}

final class Changed extends SignState {}

class LoginSuccess extends SignState {
  final String message;
  LoginSuccess(this.message);
}

class LoadingState extends SignState{}

class LoadingResetState extends SignState{}

class SignLoadingState extends SignState{}


class LoginError extends SignState{
  final error;

  LoginError(this.error);
}

class SignUpError extends SignState{
  final error;

  SignUpError(this.error);
}

class SendEmailSuccess extends SignState{
  final msg;

  SendEmailSuccess(this.msg);
}

class SendEmailFailed extends SignState{
  final msg;

  SendEmailFailed(this.msg);
}