import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_api/screens/auth_screen.dart';
import 'package:news_api/screens/homeScreen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(builder: (context, usersnapshot) {
        if (usersnapshot.hasData) {
          return HomeScreen();
        } else {
          return Authscreen();
        }
      }),
    );
  }
}
