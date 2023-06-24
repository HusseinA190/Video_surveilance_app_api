import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:finalp/moduls/profile/profileScreen.dart';
import 'package:flutter/material.dart';
import '../../view_model/cubit/profile_cubit/password_cubit/pass_state.dart';
import '../../view_model/cubit/profile_cubit/password_cubit/paswords_cubit.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



class p extends StatelessWidget {
  const p({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController passwordController=TextEditingController() ;
    TextEditingController passwordController2=TextEditingController() ;
    return BlocProvider(
      create: (context) =>  PassCubit(),
      child: BlocConsumer< PassCubit, passStates>(
          listener: (context, state) {
            if (state is GetPassSuccessState){
              final snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  content:Text("you succsses "
                    // state.msg
                  )
                /*content: AwesomeSnackbarContent(
          title: 'Error..!',
          message: state.err,
          contentType: ContentType.failure,
          ),*/
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              Timer(Duration(seconds: 5),
                      ()=>Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>
                          profile()
                      ))
              );
              // Get.to(Home());

            }
            if (state is FailedToGetPassState){
              final snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  content:Text("you failllllllld"
                    //state.err
                  )

              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);

            }

          },builder: (context, state) {
        final passCubit = PassCubit.get(context);

        return Scaffold(
          appBar: AppBar(

            title: const Center(child: Text("Change Password ")),
            //backgroundColor:Color(0xffFF8551),
            backgroundColor:Colors.black87,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                color: Color(0xffe8e4f2),

                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image(image: AssetImage('assets/images/sec.jpg',),),

                        height: MediaQuery.of(context).size.height *
                            0.5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width *0.09),
                        child: TextFormField(

                          controller: passwordController,
                          validator: (String? val)=>validatePassword(val!),

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
                        height: MediaQuery.of(context).size.height *
                            0.03,
                      ),
                      SizedBox(
                        //width: 1000,
                        // height: 80,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.09),
                          child: TextFormField(
                            controller: passwordController2,
                            validator: (String? val) {
                              if (val!=passwordController.text) {
                                return 'not match';
                              } else {
                                return null ;
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
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.04,
                      ),

                      MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5.0,
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 50,
                          ),
                          child: const Text(
                            "Change Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onPressed: () async {
                            if (_formKey.currentState!.validate()){
                              debugPrint('password is validate');
                              print(passwordController);
                              print(passwordController2);

                              PassCubit.get(context).PostPassData(
                                  p:passwordController.text,
                                  p2: passwordController2.text);

                            }
                            else
                              debugPrint('data not validate');

                          }
                      ),
                      SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      ),
      //////////
    );
  }
}

String? validatePassword(String value) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
}
 }
}