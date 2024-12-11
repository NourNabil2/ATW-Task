import 'package:atw_task/Core/utilts/Colors.dart';
import 'package:atw_task/Core/utilts/Constents.dart';
import 'package:atw_task/Core/widgetts/Back_Button_widget.dart';
import 'package:atw_task/Core/widgetts/CustomSnackBar_widget.dart';
import 'package:atw_task/Core/widgetts/CustomTextField_widget.dart';
import 'package:atw_task/Core/widgetts/CustomText_widget.dart';
import 'package:atw_task/Core/widgetts/Custom_Button_widget.dart';
import 'package:atw_task/Core/widgetts/LoadingSpinner.dart';
import 'package:atw_task/Features/Auth_page/View_model/sign_cubit.dart';
import 'package:atw_task/Features/Home_page/View/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widgets/QuestAuth_widget.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  static String id = 'LoginScreen';
  @override
  State<Loginpage> createState() => _LoginpageState();
}
class _LoginpageState extends State<Loginpage> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  var emailcontroller = TextEditingController();
  var passwaordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? email, password;
    return BlocConsumer<SignCubit, SignState>(
      listener: (context, state) {
        if (state is LoadingState) {
          isLoading = true;

        } else if (state is LoginSuccess) {
          // Handling login success cases
          isLoading = false;
          // Displaying Success from state
            Dialogs.showSnackbar(context,state.message);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Homescreen(),));
        } else if (state is LoginError) {
          isLoading = false;
          // Displaying error message
          Dialogs.showSnackbar(context, state.error);
        }
        },
      builder: (context, state) => ModalProgressHUD(
        progressIndicator: const LoadingSpinner(), // Loading spinner
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: ColorApp.mainLight,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: SizeApp.s30, vertical: SizeApp.s30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button
                    CustomBackButton(onTap: () {}),
                    // Title Text
                    CustomText(
                      text: StringApp.welcomeMsg,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    CustomText(
                      text: StringApp.welcomeMsg2,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    // Text Fields
                    const SizedBox(height: 20),
                    CustomFormTextField(
                      title: StringApp.email,
                      obscureText: false,
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: StringApp.hintEmail,
                    ),
                    CustomFormTextField(
                      title: StringApp.pass,
                      icon: SignCubit.get(context).obscure? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      obscureText: SignCubit.get(context).obscure,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: StringApp.pass,
                    ),
                    const SizedBox(height: 20),
                    const Spacer(),
                    // Buttons
                    CustomButon(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          SignCubit.get(context).userLogin(email: email!, password: password!);
                        }
                      },
                      text: StringApp.login,
                    ),
                    const SizedBox(height: 20),
                    noAccount(context),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}
