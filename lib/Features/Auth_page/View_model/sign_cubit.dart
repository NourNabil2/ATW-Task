import 'dart:developer';
import 'package:atw_task/Features/Auth_page/Model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitial());
  static SignCubit get(context) => BlocProvider.of(context);

  bool obscure = true;

  void changeObscure()
  {
    obscure = !obscure;
    emit(Changed());
  }

 Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoadingState());

   await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) {
      final user = userCredential.user;
      if (user != null) {
        try {
          emit(LoginSuccess(AuthMessageModel.getMessage('login-success')));
        } catch (e) {
          emit(LoginError(AuthMessageModel.getMessage('data-casting-error')));
          log('Data Casting Error: $e');
        }
      } else {
        // Email not found
        emit(LoginError(AuthMessageModel.getMessage('email-not-found')));
      }
    }).catchError((e) {
      if (e is FirebaseAuthException) {
        final errorMessage = AuthMessageModel.getMessage(e.code);
        emit(LoginError(errorMessage));
        log('FirebaseAuthException: ${e.code} - ${e.message}');
      } else {
        emit(LoginError(AuthMessageModel.getMessage('unknown-error')));
        log('Unknown Error: $e');
      }
    });
  }


}
