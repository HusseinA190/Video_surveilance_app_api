import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  String? Function(String?)? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(




        prefix: prefix != null
            ? Icon(
          prefix,
          // color: Colors.deepOrange,
        )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,

          ),
        )
            : null,
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color? backgroundColor ,
  Color? textColor ,
  double radius = 15.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: 330,
      height: 45.0,
      decoration: BoxDecoration(
        border: Border.all(

          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style:  TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
