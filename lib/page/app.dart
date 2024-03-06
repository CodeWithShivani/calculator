import 'package:firstproject/ui/homeview.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget
{
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Learn",
        home: Homeview(),
      theme: ThemeData(
        primarySwatch: Colors.red
      ),

    );
  }

}