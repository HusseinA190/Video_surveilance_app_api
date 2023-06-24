import 'package:flutter/material.dart';
import '../moduls/alarms/alarms_screen.dart';
import '../moduls/history/history_screen.dart';
import '../moduls/home/home_screen.dart';
import '../moduls/profile/setting.dart';


class HomeLayout extends StatefulWidget
{

  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens =
  [
    HomeScreen(),
    AlarmsScreen(),
    HistoryScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading:Container(

          child: Image.asset('assets/images/Logo.png' ),
        ),
        title: const Text('Abdetect',
          style: TextStyle(
            fontSize: 26,
          ),),
        elevation: 50,
        backgroundColor: Colors.black,
        actions:  [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (conext) {
                return const Setting();
              }));
              // do something
            },
          )


        ],

      ),



      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index){
          setState(()
          {
            currentIndex = index;
          });
        },
        items:
        const [
          BottomNavigationBarItem(

            icon:Icon(
              color:Colors.white,
              size:37,
              Icons.auto_awesome_mosaic,
            ),
            label: 'Home',
            backgroundColor: Colors.white,

          ),
          BottomNavigationBarItem(
            icon:Icon(
              size:37,
              color:Colors.white,
              Icons.add_alert,
            ),
            label: 'Alarms',
          ),
          BottomNavigationBarItem(
            icon:Icon(
              size:37,
              color:Colors.white,

              Icons.auto_stories_sharp,
            ),
            label: 'History',

            backgroundColor: Colors.white,
          ),


        ],
      ),
      body:screens[currentIndex] ,
    );
  }
}

