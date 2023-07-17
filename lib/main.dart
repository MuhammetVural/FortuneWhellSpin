import 'package:flutter/material.dart';
import 'package:spin_well_fortune/spinwell_screen.dart';
import 'package:spin_well_fortune/views/cark.dart';
import 'package:spin_well_fortune/views/home_view.dart';
import 'package:spin_well_fortune/views/randomselection.dart';
import 'package:spin_well_fortune/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueAccent,
          primarySwatch: Colors.amber,
        ),
        home: InputListApp());
  }
}
