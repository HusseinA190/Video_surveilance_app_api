import 'package:finalp/view_model/database/network/dio_helper.dart';
import 'package:finalp/view_model/database/network/local_network.dart';
import 'package:flutter/material.dart';
import 'intro.dart';
import 'moduls/Login/login.dart';
import 'layout/home_layout.dart';
import 'moduls/Splash/splash.dart';
import 'moduls/alarms/alarms_screen.dart';
import 'moduls/sign_up/sign_up.dart';
import 'moduls/Login/test.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  login();
 await CacheNetwork.cacheInitialization();
  MyApp app = MyApp();
  runApp(app);

}
class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white12),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      home :  SplashScreen(),
      routes: {
        'login':(context) => LoginScreen(),
        'home_layout':(context) =>  HomeLayout(),
        'SignUp':(context) => Sign_Up(),
       // 'AlarmsScreen':(context) => AlarmsScreen(),

      },
    );
  }

}

