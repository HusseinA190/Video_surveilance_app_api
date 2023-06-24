import 'package:finalp/moduls/profile/password.dart';
import 'package:finalp/moduls/profile/profileScreen.dart';
import 'package:flutter/material.dart';
import '../Login/login.dart';
import 'edit_profile/Edit_profile.dart';
import 'information.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black87,
        //backgroundColor:Color(0xff8481ba),
        centerTitle: true,
        title: Center(

          child:
          Center(
            child: Row(
              children: const [
                SizedBox(width: 70,),
                Icon(
                  Icons.settings,
                  size: 27,
                  //color:Color(0xff8481ba),
                  color:Colors.white,
                ),
                SizedBox(width: 7),
                Text('Settings',
                  style: TextStyle(
                  fontSize: 25.0, // set the font size to 24.0
                ) ,),
              ],
            ),
          ),


        ),
      ),
      body: Container(
        // color:  Color(0xff8481ba),
        color: Color(0xffe8e4f2),

        child:
        Column(

          children: [
            SizedBox(height :MediaQuery.of(context).size.height * 0.02),
            // const CircleAvatar(
            //   backgroundImage: AssetImage('images/im.png'),
            //   radius: 90.0,
            // ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(

                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 7,
                      blurRadius: 7,
                      offset: Offset(0, 9), // changes the position of the shadow
                    ),
                  ],
                ),
                child: const Image(
                  image:AssetImage('assets/images/profile.png'),
                  width: 175,
                  //image:AssetImage('images/im.png'),width: 175,
                  height: 175,
                  fit: BoxFit.cover,
                )
            ),

            // SizedBox(height :MediaQuery.of(context).size.width * 0.03),

            // Stack(
            //
            //
            //     children:[
            //       Container(
            //         //color: Color(0xffe8e4f2),
            //         color: Colors.white30,
            //         height: MediaQuery.of(context).size.height * 0.3,
            //         width: MediaQuery.of(context).size.width,
            //       ),
            //
            //       SizedBox(
            //       width: 180,
            //       height: 180,
            //       child:ClipRRect(
            //
            //         borderRadius: BorderRadius.circular(100),
            //         child: Image(image: AssetImage('images/img_3.png')),),
            //
            //
            //        //child: Text("Abnormal Detection"),
            //
            //
            //
            //   ),],
            // ),

            SizedBox(height :MediaQuery.of(context).size.height * 0.1),


            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()),);},

                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black54,
                  ),
                  child: const Icon(Icons.person_outline_sharp,color: Colors.black,size:28.0),
                ),
                title: const Text("  Profile",
                  style: TextStyle(
                  fontSize: 23.0, // set the font size to 16.0
                  fontStyle: FontStyle.italic, // set the font style to italic
                  fontWeight: FontWeight.bold,color: Colors.black87, ),),
                trailing:  Container(
                    width: 30,
                    height: 30,
                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.grey,),
                    child:  Icon(Icons.arrow_forward_ios,color: Color(0xffFF8551),size:28.0)),

              ),
            ),
            SizedBox(height :MediaQuery.of(context).size.height * 0.02),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => p()),);},

                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black54,
                  ),
                  child: Icon(Icons.password,color: Colors.black,size:30.0),
                ),
                title: const Text("  change password",
                  style: TextStyle(
                  fontSize: 23.0, // set the font size to 16.0
                  fontStyle: FontStyle.italic, // set the font style to italic
                  fontWeight: FontWeight.bold,color: Colors.black87, ),),
                trailing:  Container(
                    width: 30,
                    height: 30,
                    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Color(0xffFF8551),),
                    child:  Icon(Icons.arrow_forward_ios,color: Color(0xffFF8551),size:28.0)),

              ),
            ),
            SizedBox(height :MediaQuery.of(context).size.height * 0.02),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),);},

                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black54,
                  ),
                  child: Icon(Icons.edit,color: Colors.black,size:30.0),
                ),
                title: const Text("  Edit Profile",
                  style: TextStyle(
                  fontSize: 23.0, // set the font size to 16.0
                  fontStyle: FontStyle.italic, // set the font style to italic
                  fontWeight: FontWeight.bold,color: Colors.black87, ),),
                trailing:  Container(
                    width: 30,
                    height: 30,
                    child:  Icon(Icons.arrow_forward_ios,
                        color: Color(0xffFF8551),size:28.0)),

              ),
            ),
            SizedBox(height :MediaQuery.of(context).size.height * 0.02),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyInformationScreen()),
                  );},

                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black54,
                  ),
                  child: Icon( Icons.info,color: Colors.black,size:30.0),
                ),
                title: const Text("  Information",
                  style: TextStyle(
                  fontSize: 23.0, // set the font size to 16.0
                  fontStyle: FontStyle.italic, // set the font style to italic
                  fontWeight: FontWeight.bold,color: Colors.black87, ),),
                trailing:  Container(
                    width: 30,
                    height: 30,
                    child:  Icon(Icons.arrow_forward_ios,color: Color(0xffFF8551),size:28.0)),

              ),
            ),
            SizedBox(height :MediaQuery.of(context).size.height * 0.02),
            Container(
              decoration: const BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(
                //     color: Colors.white,
                //     width: 5.0,
                //   ),
                // ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),);},

                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black54,
                  ),
                  child: Icon(Icons.logout_outlined,color: Colors.black,size:30.0),
                ),
                title: const Text("  LogOut",
                  style: TextStyle(
                  fontSize: 23.0, // set the font size to 16.0
                  fontStyle: FontStyle.italic, // set the font style to italic
                  fontWeight: FontWeight.bold,color: Colors.red, ),),
                trailing:  Container(
                    width: 30,
                    height: 30,
                    child:  Icon(Icons.arrow_forward_ios,color: Color(0xffFF8551),size:28.0)),

              ),
            ),
          ],
        ),

      ),
    );
  }
}
