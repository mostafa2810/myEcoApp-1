
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:video_player/video_player.dart';
import 'notification/test_notofication.dart';
import 'viewmodel/cart_viewmodel.dart';
import 'view/home/controll_view.dart';
import 'helper/binding.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ControlViewModel());
  Get.put(AuthViewModel());
  await GetStorage.init();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
 // VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset(
    //     'assets/video11.mp4')
    //   ..initialize().then((_) {
    //     _controller.play();
    //     print("doooone");
    //     new Future.delayed(new Duration(seconds:7), ()
    //     {
    //       print("xxxx");
    //       Get.off(ControlView());
    //
    //     });
    //
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //
    //   });

    new Future.delayed(new Duration(seconds:3), ()
    {
      print("xxxx");
     // Get.off(WelcomeScreen());
      Get.off(ControlView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding:Binding(),
        debugShowCheckedModeBanner:false,
        home:
        Scaffold(
            backgroundColor: Colors.lightBlue,
            body:Center(
              child: Container(
                height:330,
                // padding:EdgeInsets.only(top:260),
                color:Colors.cyanAccent,
                child:Image.asset('assets/sum3.png',fit: BoxFit.cover,),
                //    height:510,
                //   width:900,
                // height:700,
                // child: AspectRatio(
                //   aspectRatio: _controller.value.aspectRatio,
                //   child: Stack(
                //     alignment: Alignment.bottomCenter,
                //     children: <Widget>[
                //       // Container(
                //       //
                //       //   child: VideoPlayer(_controller,
                //       //
                //       //   ),
                //       // ),
                //       //ControlsOverlay(controller: _controller),
                //       //  VideoProgressIndicator(_controller, allowScrubbing: true),
                //     ],
                //   ),
                // ),
              ),
            )
        )

      // Scaffold(
      //   body:SplashScreen()
      //  // ControlView(),
      //   //notification_test(),
      //   //
      // ),
      //   theme:ThemeData()
    );
  }
}
//mvvm ----> model View viewModel

