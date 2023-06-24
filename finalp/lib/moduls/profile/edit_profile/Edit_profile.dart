
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/profile_cubit/EditProfile_cubit/EditProfie_cubit.dart';
import '../../../view_model/cubit/profile_cubit/EditProfile_cubit/EditProfile_states.dart';
import '../../../view_model/database/network/local_network.dart';
import '../../Login/login.dart';
import '../profileScreen.dart';
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    //var cubit = ProfileCubit.get(context).profile_data;
    return BlocProvider(
      create: (BuildContext context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfieStates>(
          listener: (context, state) {
        if (state is GetEditProfieSuccessState) {
          const snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              content: Text("your data has changed successfully"));

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          Timer(
              const Duration(seconds: 5),
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                   // builder: (context) => LoginScreen(),
                    builder: (context) => const profile(),
                  )));
          // Get.to(Home());
        }
        if (state is FailedToGetEditProfieState) {
          final snackBar = const SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text("changes can not be save"),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      }, builder: (context, state) {
        TextEditingController NameController = TextEditingController();
        TextEditingController EmailController = TextEditingController();
        NameController.text = CacheNetwork.getCacheData(key: "name");
        EmailController.text = CacheNetwork.getCacheData(key: "email");
        //var cubit = ProfileCubit.get(context).profile_data;

        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(MaterialPageRoute(builder: (context) {
                      return
                          //EditProfilePage();
                          const profile();
                      // const profile();
                    }));
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded)),
              title: const Center(child: Text("Edit profile")),
              //backgroundColor:Color(0xffFF8551),
              backgroundColor: Colors.black87,
            ),
            body: Container(
              color: const Color(0xffe8e4f2),
              padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/img_3.png',
                                    ),
                                  )),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.green,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      // TextField(
                      //  controller: NameController,
                      //   decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.only(bottom: 3),
                      //
                      //       floatingLabelBehavior: FloatingLabelBehavior.always,
                      //       hintText: "Full Name",
                      //       hintStyle: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.black,
                      //       )),
                      // ),
                      TextFormField(
                        controller: NameController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.3),
                          // color: Colors.grey.withOpacity(0.3),
                          //<-- SEE HERE
                          hintText: "Full Name",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),

                          prefixIcon: const Icon(
                            Icons.drive_file_rename_outline,
                          ),
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
                                color: Colors.green,
                                width: 1.0,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: EmailController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.3),
                          // color: Colors.grey.withOpacity(0.3),
                          //<-- SEE HERE
                          hintText: "Email",
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),

                          prefixIcon: const Icon(
                            Icons.email,
                          ),
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
                                color: Colors.green,
                                width: 1.0,
                              )),
                        ),
                      ),
                      // TextField(
                      //   controller: EmailController,
                      //   decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.only(bottom: 3),
                      //
                      //       floatingLabelBehavior: FloatingLabelBehavior.always,
                      //       hintText: "Email",
                      //       hintStyle: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.black,
                      //       )),
                      // ),
                      //buildTextField("Full Name", cubit!.name!, false),
                      // buildTextField("E-mail", cubit!.email!, false),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              // Background color
                              padding: const EdgeInsets.symmetric(horizontal: 27),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              NameController.text =
                                  CacheNetwork.getCacheData(key: "name");
                              EmailController.text =
                                  CacheNetwork.getCacheData(key: "email");
                              // NameController.clear() ;
                              // EmailController.clear() ;
                            },
                            child: const Text("CANCEL",
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2.2,
                                    color: Colors.black)),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                debugPrint('data is validate');
                                print(NameController);
                                print(EmailController);

                                EditProfileCubit.get(context).PostprofileData(
                                    Name: NameController.text,
                                    Email: EmailController.text);

                              } else
                                debugPrint('data not validate');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              // Background color
                              padding: const EdgeInsets.symmetric(horizontal: 44),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 21,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      }),
      //////////
    );
  }
}
