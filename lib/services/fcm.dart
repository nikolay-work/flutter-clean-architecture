import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}

class FCM {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final notificationsStream = StreamController<PushNotification>.broadcast();

  setNotifications() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    //   notificationsStream.sink.add(
    //     PushNotification(
    //       title: message.notification?.title,
    //       body: message.notification?.body,
    //     ),
    //   );
    // });
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        notificationsStream.sink.add(
          PushNotification(
            title: message.notification?.title,
            body: message.notification?.body,
          ),
        );
      });
    } else {
      print('User declined or has not accepted permission');
    }
    final token =
    _messaging.getToken().then((value) => print('Token: $value'));
  }

  // showAlertDialog(BuildContext context) {
  //
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text("Cancel"),
  //     onPressed:  () {},
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text("Continue"),
  //     onPressed:  () {},
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("AlertDialog"),
  //     content: Text("Would you like to continue learning how to use Flutter alerts?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
