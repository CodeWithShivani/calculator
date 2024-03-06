import 'package:firstproject/page/calculatorview.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        bottom: false,
        child: Calculatorview(),
      ),
    );
  }
}
