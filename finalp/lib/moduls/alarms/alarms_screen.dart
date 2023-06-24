import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/alarm_cubit/alarm_cubit.dart';
import '../../view_model/cubit/alarm_cubit/alarms_state.dart';
import '../../view_model/database/network/local_network.dart';
class AlarmsScreen extends StatelessWidget {
   AlarmsScreen({Key? key}) : super(key: key);
   List<int?> Ids = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AlarmsCubit()..getAlarms(),
        child: BlocConsumer<AlarmsCubit, AlarmStates>(
          builder: (context, state) {
            print(CacheNetwork.getCacheData(key: 'token'));
            var cubit = AlarmsCubit.get(context).alarm;


           if (state is GetAlarmsSuccessState){
             print(Ids);
             return Ids[0]!>Ids[1]! ?CircularProgressIndicator(): Scaffold(
               backgroundColor: Colors.black12,
               body: cubit != null
                   ? SafeArea(
                     child: Column(
                 children: [
                     Ids[0]! >Ids[1]! ?CircularProgressIndicator():Container(
                       height: 155,
                       child: Card(
                         margin: const EdgeInsets.all(20),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             ListTile(
                               leading: cubit.image_ur != null
                                   ? SizedBox(
                                 child: InkWell(
                                   onTap: () {
                                     showDialog(
                                         context: context,
                                         builder: (BuildContext
                                         context) =>
                                             AlertDialog(
                                               title: null,
                                               content: Container(
                                                 height: 150,
                                                 width: 200,
                                                 decoration:
                                                 BoxDecoration(
                                                     image:
                                                     DecorationImage(
                                                       image: NetworkImage(
                                                           "https://apica-camapi.up.railway.app/api/user${cubit.image_ur}"),
                                                       fit: BoxFit.fill,
                                                     )),

                                               ),
                                               actions: [
                                                 ElevatedButton(
                                                   style:
                                                   ElevatedButton
                                                       .styleFrom(
                                                     primary: Colors
                                                         .red, // Background color
                                                   ),
                                                   onPressed: () =>
                                                       Navigator.of(
                                                           context)
                                                           .pop(true),
                                                   //return true when click on "Yes"
                                                   child: const Text(
                                                       'Close'),
                                                 ),
                                               ],
                                             ));
                                   },
                                   child: Container(
                                     child: CachedNetworkImage(
                                       imageUrl: "https://apica-camapi.up.railway.app/api/user${cubit.image_ur}",
                                       width: 150,
                                       // Set width3
                                       height: 150,
                                       placeholder: (context, url) =>
                                           CircularProgressIndicator(),
                                       errorWidget:
                                           (context, url, error) =>
                                           Icon(Icons.error),
                                     ),
                                   ),
                                 ),
                               )
                                   : Icon(Icons.error),
                               title: Padding(
                                 padding: const EdgeInsets.only(top: 25.0),
                                 child: Text(
                                   cubit.alarmat as String,
                                   style: const TextStyle(
                                     fontSize: 22.0,
                                   ),
                                 ),
                               ),
                               subtitle: Padding(
                                 padding: const EdgeInsets.only(top: 8.0),
                                 child: Text(
                                   "Camera id :" '${cubit.cameria}',
                                   style: const TextStyle(
                                     color: Colors.black,
                                     fontSize: 11.0,
                                     fontWeight: FontWeight.w300,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                 ],
               ),
                   )
                   : const Center(
                 child: CircularProgressIndicator(),
               ),
             );

           }
           return Container();
          },
          listener: (context, state) {
            if( state is GetAlarmsSuccessState){
              Ids.add(0);
              Ids.add(AlarmsCubit.get(context).alarm!.id);
              print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
              print(Ids);
            }
          },
        ));
  }
}
