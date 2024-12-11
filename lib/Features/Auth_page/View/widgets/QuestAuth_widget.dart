import 'package:atw_task/Core/utilts/Colors.dart';
import 'package:atw_task/Core/utilts/Constents.dart';
import 'package:flutter/material.dart';
Widget noAccount(context)
{
 return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       Text(
        StringApp.noAccount,
        style: Theme.of(context).textTheme.labelLarge
      ),
      GestureDetector(
        onTap: () {
         // Navigator.pushNamed(context, Signup.id);
        },
        child: const Text(
          StringApp.register,
          style: TextStyle(color: ColorApp.primaryColor ,fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}