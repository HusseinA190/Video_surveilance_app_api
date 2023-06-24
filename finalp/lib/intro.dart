import 'package:flutter/material.dart';
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                //alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height *0.5,
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0), //حته فوق فاضيه
                    //height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(

                      ),
                    ),),
                  Container(
                    height: MediaQuery.of(context).size.height *0.5,
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0), //حته فوق فاضيه
                    //height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        //topLeft: Radius.circular(
                        //MediaQuery.of(context).size.width * 0.0999),
                        bottomRight: Radius.circular(
                            MediaQuery.of(context).size.width * 0.18),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Logo.png',height: MediaQuery.of(context).size.height *0.4,),
                        const SizedBox(
                          height: 3,
                        ),

                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *0.5,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.5), //حته فوق فاضيه
                    //height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),),
                  Container(
                    height: MediaQuery.of(context).size.height *0.5,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.5), //حته فوق فاضيه
                    //height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width * 0.18),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text('Welcome',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('''Here You Will Detect the  
Abnormal Actions Without
     Doing alot of Effort''',
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.normal,
                            fontSize: 17,
                          ),),
                        const SizedBox(
                          height: 14,
                        ),
                        MaterialButton(
                          elevation: 5.0,
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 80,
                          ),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50,),
                            borderSide: BorderSide.none,
                          ),
                          onPressed:() {
                            Navigator.of(context).pushNamed('login');
                          },

                          child: const Text(
                            "Getting Started",

                            style: TextStyle(
                              color: Colors.white,
                              //backgroundColor: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),),
                ],
              ),],
          ),)
    );
  }
}
