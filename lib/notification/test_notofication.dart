//
//
//
// // ignore_for_file: camel_case_types
//
// import 'dart:async';
// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart' as http;
//
//
//
// class notification_test extends StatefulWidget {
//
//   @override
//   State<notification_test> createState() => _notification_testState();
// }
//
//
//
// class _notification_testState extends State<notification_test> {
//   final String serverToken = 'AAAAI-AILq0:APA91bHxcVVbOIokUoScb_93XvoJCGsQCrN6FvZPos33M0TOL9MEJX01mgm64154WIPcLQmq3LPfdxGQre7yKESbso2Kvc0yGtiiV7a5zQSm2pw1YEhEnCYaYVU5JUvEfAOx1dSKscQT';
//
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//  var fbm=FirebaseMessaging;
//
//
//   @override
//   void initState() {
//   // Firebase.initializeApp();
//     super.initState();
//     getMessages();
//   // print("ffff="+firebaseMessaging.getToken().toString());
//
//   }
//
//   // initialMessage()async{
//   //   print("ffff="+firebaseMessaging.getToken().toString());
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // Replace with server token from firebase console settings.
//
//     return Scaffold(
//       body:Container(
//         child:Column(
//           children:[
//             SizedBox(
//               height:30
//             ),
//             RaisedButton(
//               onPressed:(){
//
//                 sendNotify();
//                 sendAndRetrieveMessage();
//                 print("ooo");
//                 getMessages();
//               },
//             )
//           ]
//         )
//       )
//     );
//   }
//
//   sendNotify() async{
//
//
//   // Future<Map<String, dynamic>> sendAndRetrieveMessage() async {
//   //
//   //   await firebaseMessaging.requestNotificationPermissions(
//   //     const IosNotificationSettings(sound: true, badge: true,
//   //         alert: true, provisional: false),
//   //   );
//   //
//   //   final Completer<Map<String, dynamic>> completer =
//   //   Completer<Map<String, dynamic>>();
//   //
//   //   firebaseMessaging.configure(
//   //     onMessage: (Map<String, dynamic> message) async {
//   //       completer.complete(message);
//   //     },
//   //   );
//   //
//   //   return completer.future;
//   // }
//
//   {
//     await http.post(
//       'https://fcm.googleapis.com/fcm/send',
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Authorization': 'key=$serverToken',
//       },
//       body: jsonEncode(
//         <String, dynamic>{
//           'notification': <String, dynamic>{
//             'body': 'this is a body',
//             'title': 'this is a title'
//           },
//           'priority': 'high',
//           'data': <String, dynamic>{
//             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//             'id': '1',
//             'status': 'done'
//           },
//           'to':  'eDg6_R9lRV28G6y2UbKiIo:APA91bHCic43UFBv2PwLEJD67H7SIn19oJ9LotJomGnT0GEjY9YYow_BTU6i9LzWzao0nvQRYObyOJeGd5kXPY9r07MzNxY_is-itgNCVMUjVg8IDpI3obNVudGEPILFD9vzl5I1fr8S'//await firebaseMessaging.getToken(),
//         },
//       ),
//     );
//   }
//
// }
//   getMessages(){
//
//     FirebaseMessaging fcm=FirebaseMessaging();
//     fcm.configure(onMessage:(message) {
//       print("msg="+message.toString());
//       return firebaseMessaging.onTokenRefresh.first;
//     },);
//     //print(firebaseMessaging.getToken());
//
//   }
//
//   void sendAndRetrieveMessage() {
//
//   }
// }
