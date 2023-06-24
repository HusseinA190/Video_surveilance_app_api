import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:tag/controliers/registeration_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view_model/cubit/Sign_cubit/sign_cubit.dart';
import '../../view_model/cubit/Sign_cubit/sign_states.dart';


import '../Login/login.dart';
import '../home/home_screen.dart';


class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _SignUpState();
}

class _SignUpState extends State<Sign_Up> {
  //RegisterationController registerationController =Get.put(RegisterationController());
  final Future<SharedPreferences> _prefs=SharedPreferences.getInstance();
  var valueDrop = 0;

  late final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameController=TextEditingController() ;
    TextEditingController emailController=TextEditingController() ;
    TextEditingController phoneNumberController=TextEditingController() ;
    TextEditingController passwordController=TextEditingController() ;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is RegisterSuccess){
              final snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  content:Text(state.msg)

              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              Timer(Duration(seconds: 5),
                      ()=>Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>
                          LoginScreen()
                      ))
              );
              // Get.to(Home());

            }
            if (state is RegisterError){
              final snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  content:Text(state.err)

              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);

            }

          },builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Form(
              key:appCubit.formKey,
              //_formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height *
                                0.08), //حته فوق فاضيه
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                MediaQuery.of(context).size.width * 0.0999),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 75),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.3,right:MediaQuery.of(context).size.width * 0.2 ),
                              child: Row(
                                children: [
                                  Text(
                                    """Create New""",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.35,right:MediaQuery.of(context).size.width * 0.33 ),
                              child: Row(
                                children: [
                                  Text(
                                    """Account""",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.25,right:MediaQuery.of(context).size.width * 0.25),
                                  child: Text(" Already Registered? Log in"),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.44,right:MediaQuery.of(context).size.width * 0.44 ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to( LoginScreen());
                                    },
                                    child: const Text('here.',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                        )),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 45,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                              child: TextFormField(
                                // controller: textEditingController,
                                controller: appCubit.nameController,


                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Please Enter Name';
                                  }
                                  return null;
                                },
                                //keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  hintText: "Name",
                                  prefixIcon: const Icon(Icons.account_box_outlined),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                ),
                              ),
                            ),
                            //////////////////////////////////////////////////////////
                            SizedBox(
                              height: 11,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                              child: TextFormField(
                                controller: appCubit.emailController,


                                validator: (String? val) {
                                  if (!val!.contains('@gmail.com')) {
                                    //if (!val!.contains('@gmail.com')) {
                                    return 'E-Mail does not contain @gmail.com';
                                  } else {
                                    return null;
                                  }
                                },
                                //keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  //<-- SEE HERE
                                  hintText: "Email",
                                  prefixIcon: const Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                ),
                              ),
                            ),
                            //////////////////////////////////////////////////////////
                            SizedBox(
                              height: 11,
                            ),


                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                              child: TextFormField(

                                controller: appCubit.passwordController,
                                validator: (val) => appCubit.validatePassword(val!),

                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  //<-- SEE HERE
                                  hintText: "passWord",
                                  prefixIcon: const Icon(Icons.password),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                              child: TextFormField(
                                controller: appCubit.password2Controller,
                                validator: (String? val) {
                                  if (val!=appCubit.passwordController.text) {
                                    return 'not match';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  //<-- SEE HERE
                                  hintText: "confirm password",
                                  prefixIcon: const Icon(Icons.password),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        20,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.blue,
                                        width: 1.0,
                                      )),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            MaterialButton(
                                elevation: 5.0,
                                color: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 65,
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                onPressed: () async {
                                  appCubit.validateData(context);
                                  // if (_formKey.currentState!.validate()){
                                  //   debugPrint('data is validate');
                                  //
                                  // }
                                  // else
                                  //   debugPrint('data not validate');
                                  //final SharedPreferences? prefs= await _prefs;
                                  //print(prefs?.get('token'));

                                }
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );}
      ),
    );
  }
}
