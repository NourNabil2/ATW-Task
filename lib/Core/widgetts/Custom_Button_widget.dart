import 'package:atw_task/Core/utilts/Constents.dart';
import 'package:flutter/material.dart';



class CustomButon extends StatelessWidget {
  CustomButon({this.onTap, required this.text});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(SizeApp.s10),
        height: SizeApp.s50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black12 ,blurRadius: 50,spreadRadius: 1)
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(SizeApp.s10),

        ),
        child: Text(
          text,
    style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
