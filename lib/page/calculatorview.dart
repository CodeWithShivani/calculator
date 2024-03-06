import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculatorview extends StatefulWidget {
  const Calculatorview({super.key});


  @override
  State<Calculatorview> createState() => _CalculatorviewState();
}

class _CalculatorviewState extends State<Calculatorview> {

  int x=0;
  int y=0;
  num z=0;
  final displayController_One= TextEditingController();
  final displayController_Two= TextEditingController();
  late final AppLifecycleListener _listener;     //using lifecycle of flutter


  @override
  void initState() {
    DeviceOrientation.portraitUp;
    displayController_One.text = x.toString();
    displayController_Two.text = y.toString();

    _listener=AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
      // onExitRequested: _onExitRequested,
    );
  }

  void _onShow()=> print("onShow Called");
  void _onHide()=> print("onHide Called");
  void _onResume()=> print("onResume Called");
  void _onDetach()=> print("onDetach Called");
  void _onInactive()=> print("onInactive Called");
  void _onPause()=> print("onPause Called");
  void _onRestart()=> print("onRestart Called");
  void _onStateChange(AppLifecycleState state)
  {print("onStateChange Called with state : $state");}


  @override
  void dispose() {
    displayController_One.dispose();
    displayController_Two.dispose();
    _listener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(20.0),
      child: Column(
        children: [
          DisplayOne(hint :"Enter First Number", controller : displayController_One),
          SizedBox(
            height: 30,
          ),

          DisplayOne(hint :"Enter Second Number" , controller : displayController_Two),
          SizedBox(
            height: 30,
          ),
         Text(z.toString(),
           style: TextStyle(
             fontSize: 60,
             fontWeight: FontWeight.bold,
           ),
         ),
         Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             FloatingActionButton(onPressed: (){
               setState(() {
                 z=num.tryParse(displayController_One.text)! + num.tryParse(displayController_Two.text)!;
               });

             },
             child: Icon (Icons.add),
             ),
              FloatingActionButton(onPressed: (){
                setState(() {
                  z=num.tryParse(displayController_One.text)!-num.tryParse(displayController_Two.text)!;
                });

              },
                child: Icon (CupertinoIcons.minus),),
              FloatingActionButton(onPressed: (){
                setState(() {
                  z=num.tryParse(displayController_One.text)!*num.tryParse(displayController_Two.text)!;
                });

              },
                child: Icon (CupertinoIcons.multiply),),
              FloatingActionButton(onPressed: (){
                setState(() {
                  z=num.tryParse(displayController_One.text)!/num.tryParse(displayController_Two.text)!;
                });

              },
                child: Icon (CupertinoIcons.divide),),

            ],

          ),
          SizedBox(height: 5,),

          FloatingActionButton(onPressed: (){
            setState(() {
              x=0;
              y=0;
              z=0;

              displayController_One.clear();
              displayController_Two.clear();
            });

          },
              child: Text("Clear"))
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne({super.key,
     this.hint= "enter the number",
     required this.controller});
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          labelText: "Number",
          hintText: hint
          ,hintStyle: TextStyle(
          color: Colors.black
      )
      ),
    );
  }
}

