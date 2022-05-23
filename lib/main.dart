import 'package:e_softwarica/navigation.dart';
import 'package:e_softwarica/screens/login.dart';
import 'package:e_softwarica/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
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
        '/': (context) => const Login(),
        '/register': (context) => const Register(),
        '/navigation': (context) => const ButtomNavigation(
              key: Key('ButtomNavigation'),
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
