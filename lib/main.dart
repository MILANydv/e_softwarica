import 'dart:async';

import 'package:e_softwarica/navigation.dart';
import 'package:e_softwarica/screens/camera_screen.dart';
import 'package:e_softwarica/screens/login.dart';
import 'package:e_softwarica/screens/permission_screen.dart';
import 'package:e_softwarica/screens/register.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/': (context) => const ButtomNavigation(
              key: Key('ButtomNavigation'),
            ),
        '/permission': (context) => const GalleryScreen(),
        '/take_picture': (context) => const TakeImage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
