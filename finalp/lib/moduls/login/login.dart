import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalp/view_model/cubit/login_cubit/login_state.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../view_model/cubit/login_cubit/login_cubit.dart';
import '../../../view/text_field.dart';
import '../../layout/home_layout.dart';
import '../../shared/components.dart';

class LoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=> LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccess){
            showTopSnackBar(
              context,
              const CustomSnackBar.success(

                message:
                "Login Successfully",
              ),
            );
            navigateAndFinish(
                context, HomeLayout());
          }
          if (state is LoginError){
            showTopSnackBar(
              context,
              const CustomSnackBar.error(
                message:
                "The data is incorrect,Please try again",
              ),



            );
          }

        },
        builder: (context,state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Form(
                  key: LoginCubit.get(context).formKey,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),

                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            //alignment: Alignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height *0.3,
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0), //حته فوق فاضيه
                                //height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                  color: Colors.white,

                                ),),
                              Container(
                                height: MediaQuery.of(context).size.height *0.3,
                                width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0), //حته فوق فاضيه
                                //height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                  color: Colors.black,

                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/Logo.png',height: MediaQuery.of(context).size.height *0.3,),


                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *0.7,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.3), //حته فوق فاضيه
                                //height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),),
                              Container(
                                height: MediaQuery.of(context).size.height *0.7,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.3), //حته فوق فاضيه
                                //height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        MediaQuery.of(context).size.width * 0.18),
                                  ),
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      const Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:45.0,
                                          fontWeight: FontWeight.w900,

                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Text(
                                        'Sign in to continue ',
                                        style: TextStyle(
                                          fontSize:17.0,
                                          color: Colors.black54,



                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      defaultFormField(
                                          controller: LoginCubit.get(context).emailController,
                                          label: 'Enter Your Email',
                                          type: TextInputType.emailAddress,
                                          validate: (val) {
                                            if (val!.isEmpty) {
                                              return 'Please Enter E-mail';
                                            }
                                            return null;
                                          }
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      defaultFormField(
                                          controller: LoginCubit.get(context).passwordController,

                                          label: 'Enter Your Password',
                                          type: TextInputType.visiblePassword,
                                          isPassword: LoginCubit.get(context).isPasswordShown,
                                          suffix: LoginCubit.get(context).suffixIcon,
                                          suffixPressed: () {
                                            LoginCubit.get(context).changePasswordIcon();
                                          },
                                          validate: (val) {
                                            if (val!.isEmpty) {
                                              return 'Please Enter Password';
                                            }
                                            return null;
                                          }


                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      ConditionalBuilder(
                                        builder: (context) => defaultButton(
                                          function: () {
                                            print(LoginCubit.get(context)
                                                .passwordController
                                                .text);
                                            print(
                                                LoginCubit.get(context).emailController.text);
                                            LoginCubit.get(context).validateData(context);

                                          },
                                          text: ('Log in'),
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                        ),
                                        condition: state is! LoginLoading,
                                        fallback: (context) => const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'You Do Not Have an account?,Join Us Now . ',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14.0,


                                            ),
                                          ),
                                          TextButton(
                                            onPressed:() {
                                              Navigator.of(context).pushNamed('SignUp');
                                            },
                                            child: const Text(
                                              'Sign Up!',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14.0,
                                                decoration: TextDecoration.underline ,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),],
                      ),
                    ],
                  ),
                ),


              ),
            ),
          );
        },
      ),
    );
  }
}
