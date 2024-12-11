import 'package:atw_task/Features/Auth_page/View_model/sign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:atw_task/Core/utilts/Colors.dart'; // Assuming ColorApp is defined here
import 'package:atw_task/Core/utilts/Constents.dart'; // Assuming SizeApp is defined here

// ignore: must_be_immutable
class CustomFormTextField extends StatefulWidget {
  CustomFormTextField({
    this.color,
    this.style,
    this.minLines,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.initialValue,
    this.onSaved,
    this.icon,
    this.textEditingController,
    this.title,
    this.keyboardType,
  });

  Function(String)? onChanged;
  String? hintText;
  String? title;
  TextStyle? style;
  Color? color;
  int? minLines;
  TextInputType? keyboardType;
  String? initialValue;
  TextEditingController? textEditingController;
  Function(dynamic)? onSaved;
  bool? obscureText;
  IconData? icon;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  late FocusNode _focusNode;
  Color _backgroundColor = ColorApp.blackColor5; // Default background color

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Add listener to change background color when focus changes
    _focusNode.addListener(() {
      setState(() {
        _backgroundColor = _focusNode.hasFocus ? ColorApp.mainLight : ColorApp.blackColor5;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose the FocusNode when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeApp.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.title}', style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: SizeApp.s5),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(SizeApp.s10)),
                boxShadow: [
            _focusNode.hasFocus ? const BoxShadow(color: ColorApp.primaryColor,spreadRadius: 1,blurRadius: 8,blurStyle: BlurStyle.normal) : const BoxShadow(color: Colors.transparent)
            ]),
            child: TextFormField(
              focusNode: _focusNode, // Assign the focus node
              minLines: widget.minLines ?? 1,
              maxLines: widget.obscureText == true ? 1 : 20,
              style: Theme.of(context).textTheme.bodyMedium,
              keyboardType: widget.keyboardType,
              controller: widget.textEditingController,
              initialValue: widget.initialValue,
              onSaved: widget.onSaved,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: widget.obscureText!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your ${widget.hintText!.toLowerCase()}";
                }
                // Check for password validation
                else if (widget.hintText!.toLowerCase() == "passwords") {
                  if (value.length < 8) {
                    return "Password must be at least 8 characters long.";
                  } else if (!RegExp(r".*[A-Z].*").hasMatch(value)) {
                    return "Password must contain at least one uppercase letter.";
                  } else if (!RegExp(r".*[a-z].*").hasMatch(value)) {
                    return "Password must contain at least one lowercase letter.";
                  } else if (!RegExp(r".*\d.*").hasMatch(value)) {
                    return "Password must contain at least one number.";
                  }
                } else if (widget.hintText!.toLowerCase() == "Your email") {
                  if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
                    return "Please enter a valid email.";
                  }
                }

                // If all validations pass
                return null;
              },
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                suffixIcon: widget.icon != null ? IconButton(icon: Icon(widget.icon, size: 24) , color: Theme.of(context).textTheme.labelLarge?.color, onPressed: () {
                  SignCubit.get(context).changeObscure();
                },) : null,
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.labelLarge,
                fillColor: _backgroundColor, // Change background color when focused
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(SizeApp.s10)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
