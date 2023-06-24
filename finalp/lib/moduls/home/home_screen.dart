import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:video_player/video_player.dart';

import '../../view_model/cubit/alarm_cubit/alarm_cubit.dart';
import '../../view_model/cubit/alarm_cubit/alarms_state.dart';
import '../../view_model/database/network/local_network.dart';
import'dart:async';

import '../alarms/alarms_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  late double _timeOut;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState(){
    //timer();
    super.initState();
    _controller =  VideoPlayerController.asset("assets/videos/model.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);

  }

  void timer ( {required Function onTtap}){
    _timeOut=0;
    _timer = Timer.periodic(Duration(milliseconds: 9000), (timer) {
      _timeOut +=16;
      showTopSnackBar(
       onTap:(){
         return onTtap();
       },
        context,
        const CustomSnackBar.success(
          backgroundColor: Colors.red,
          message:
          "Alarm found",
        ),
      );
      print("Time out:" + _timeOut.toString());
    });
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => AlarmsCubit()..getAlarms(),
        child: BlocConsumer<AlarmsCubit, AlarmStates>(
          listener: (context, state) {
            if (state is GetAlarmsSuccessState){
              timer(onTtap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlarmsScreen()),);
              });


            }


          },
          builder: (context, state) {
            print(CacheNetwork.getCacheData(key: 'token'));
            var cubit = AlarmsCubit.get(context).alarm;


            if (state is GetAlarmsSuccessState){
              return Scaffold(
                  backgroundColor: Colors.black,
                  body: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return Center(

                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        );
                      }
                      else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: (){
                        setState(() {
                          if(_controller.value.isPlaying){
                            _controller.pause();
                          }
                          else{
                            _controller.play();
                          }
                        });
                      },
                      child: Icon(
                          color:Colors.black,
                          size:30,
                          _controller.value.isPlaying ? Icons.pause:Icons.play_arrow

                      ),
                      ),


                  );

            }
            return Container();
          },

        ));

  }
}

