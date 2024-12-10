part of 'sign_cubit.dart';

@immutable
sealed class SignState {}

final class SignInitial extends SignState {}

class LoginSuccess extends SignState {
  final String userId;
  LoginSuccess(this.userId);
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