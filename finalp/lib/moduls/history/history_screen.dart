import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/history_cubit/history_cubit.dart';
import '../../view_model/cubit/history_cubit/history_state.dart';
import '../../view_model/database/network/local_network.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HistoryCubit()..getHistory(),
        child: BlocConsumer<HistoryCubit, HistoryStates>(
          builder: (context, state) {
            print(CacheNetwork.getCacheData(key: 'token'));
            final historyData = BlocProvider.of<HistoryCubit>(context);
            print(historyData.history.length);
            return Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: historyData.history.length,
                      itemBuilder: (BuildContext context, int index) {
                        return historyData.history.length > 0
                            ? Container(
                                height: 110,
                                child: Card(
                                  margin: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: historyData
                                                    .history[index].image_ur!=
                                                null
                                            ? SizedBox(
                                                height: 110,
                                                child: InkWell(
                                                  onTap: () {
                                                     showDialog(
                                                         context: context,
                                                         builder:
                                                             (BuildContext
                                                                     context) =>
                                                                 AlertDialog(
                                                                   title: null,
                                                                   content:
                                                                      Container(
                                                                     height: 150,
                                                                    width: 200,
                                                                     decoration:
                                                                        BoxDecoration(
                                                                           image:
                                                                                 DecorationImage(
                                                                       image: NetworkImage(
                                                                           "https://apica-camapi.up.railway.app/api/user${historyData.history[index].image_ur}"),
                                                                       fit: BoxFit
                                                                           .fill,
                                                                     )),
                                                                     child: Column(
                                                                        children: [
                                                                         Container(
                                                                              width: 100,
                                                                           child: Image(image: NetworkImage("https://apica-camapi.up.railway.app/api/user${historyData.history[index].image_ur}"
                                                             ),)
                                                                       ),

                                                                       ],
                                                                      ),
                                                                   ),
                                                                   actions: [
                                                                     ElevatedButton(
                                                                      style: ElevatedButton
                                                                           .styleFrom(
                                                                         primary:
                                                                             Colors.red, // Background color
                                                                       ),
                                                                      onPressed:
                                                                         () =>
                                                                             Navigator.of(context).pop(true),
                                                                    //return true when click on "Yes"
                                                                      child: const Text(
                                                                          'Close'),
                                                                   ),
                                                                  ],
                                                                ));
                                                  },
                                                  child: Container(
                                                    child: Image(
                                                      image: NetworkImage(
                                                          "https://apica-camapi.up.railway.app/api/user${historyData.history[index].image_ur}"),
                                                         height: 170,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Icon(Icons.error),
                                        title: Text( '${historyData
                                            .history[index].alarmat}'),
                                        subtitle: Text(
                                          "Camera id :"
                                          '${historyData.history[index].cameria}',
                                          style: const TextStyle(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ))
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is LoadingHistoryState) {
              print(" not Donne");
            } else if (state is GetHistorySuccessState) {
              print("Donne");
            }
          },
        ));
  }
}
