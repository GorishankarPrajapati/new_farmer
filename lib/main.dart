import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:software_lab/screens/splash_screen.dart';

String? deviceToken;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//  deviceToken = await fetchFCMToken();
  print('Device Token: $deviceToken');
  runApp(MyApp());
}

String? token;

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// Future<String?> fetchFCMToken() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   // Request permission to receive notifications (optional)
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   // Get the device token
//   // String? token = await messaging.getToken();
//   // return token;
//}
