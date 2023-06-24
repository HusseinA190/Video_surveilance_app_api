import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/profile_cubit/profile_cubit.dart';
import '../../view_model/cubit/profile_cubit/profile_state.dart';
import '../../view_model/database/network/local_network.dart';
class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;

    return BlocProvider(
      create:(BuildContext context)=> ProfileCubit()..getProfieData(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context,state){
          if(state is GetProfileSuccessState){
            CacheNetwork.insertToCache(key: "id", value: "${ProfileCubit.get(context).profile_data?.id!}");
            CacheNetwork.insertToCache(key: "name", value: "${ProfileCubit.get(context).profile_data?.name!}");
            CacheNetwork.insertToCache(key: "email", value: "${ProfileCubit.get(context).profile_data?.email!}");
          }
        },

        builder: (context,state) {
          print(CacheNetwork.getCacheData(key: 'token'));
          var cubit = ProfileCubit.get(context).profile_data;
          int? id = cubit?.id;
          return  Scaffold(
            appBar: AppBar(
              title: const Center(child: Text("Profile",
                style: TextStyle(

                fontSize:32,
              ),),),
              backgroundColor: Colors.black,
            ),


            body: cubit != null?

            Container(

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/camB.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),

              //color: Colors.black,
              child: Center(

                child: Column(


                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    const SizedBox(height:35,),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/im.png'),
                      radius: 95.0,
                    ),
                    const SizedBox(height:70,),
                    Container(


                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      margin: const EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 5),
                      height: 50,
                      width: 400,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10,),
                          //Icon(Icons.perm_identity),
                          //SizedBox(width: 6,),
                          const Text("ID :",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          const SizedBox(width: 15,),
                          Text("${cubit.id!}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    //SizedBox(height: 1,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      margin: const EdgeInsets.only(left: 50,right: 50,top: 5,bottom: 5),
                      height: 50,
                      width: 400,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10,),
                          const Icon(Icons.supervised_user_circle,size: 30,),
                          const SizedBox(width: 25,),
                          Text(cubit.name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(height: 1,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      margin: EdgeInsets.only(left: 50,right: 50,top: 5,bottom: 5),
                      height: 50,
                      width: 400,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.email,size: 30,),
                          SizedBox(width: 25,),
                          Text(cubit.email!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize:18,
                            ),
                          )
                        ],
                      ),
                    ),
                    //Text(cubit.email!),
                    //Text(cubit.name!),

                  ],

                ),
              ),
            ) :
            const SizedBox(width: 1,),


            // cubit != null?

          );

        },
      ),
    );

  }
}
