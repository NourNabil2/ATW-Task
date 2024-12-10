import 'dart:developer';
import 'package:atw_task/Features/Auth_page/Model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitial());
  static SignCubit get(context) => BlocProvider.of(context);


  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingState());

    // Firebase Authentication sign-in
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) {
      final user = userCredential.user;

      if (user != null) {
        if (user.emailVerified) {
          // Emit success state with user data
          emit(LoginSuccess(AuthMessageModel.getMessage('login-success')));
        } else {
          // Email not verified
          emit(LoginError(AuthMessageModel.getMessage('email-not-verified')));
        }
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

  Future<void> sendPasswordResetEmail(String? email) async {
    emit(LoadingResetState());
    try {
        // Send password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
        emit(SendEmailSuccess("Password reset email has been sent! Check your inbox."));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(SendEmailFailed("The provided email address is invalid."));
      } else {
        emit(SendEmailFailed("An unexpected error occurred: ${e.message}"));
      }
    } catch (e) {
      emit(SendEmailFailed("An unknown error occurred. Please try again later."));
    }
  }
}
