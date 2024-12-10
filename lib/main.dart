import 'package:atw_task/Core/theme/ThemeData.dart';
import 'package:atw_task/Core/utilts/Colors.dart';
import 'package:atw_task/Features/Auth_page/View/Login_screen.dart';
import 'package:atw_task/Features/Auth_page/View_model/sign_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

int? userId ;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //for setting orientation to portrait only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignCubit()),
      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: true,
            theme: ThemeApp.getLightThemeData(),

            themeMode: ThemeMode.light,
            routes: <String, WidgetBuilder>{
              Loginpage.id: (context) => const Loginpage(),
            },
            initialRoute: Loginpage.id,
          ));
        }
  }

