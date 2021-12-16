import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:flutter_tex/flutter_tex.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ernst Angle Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ernst Angle Calculator'),
        ),
        body: UpdateText(),
      ),
    );
  }
}

class UpdateText extends StatefulWidget {

  UpdateTextState createState() => UpdateTextState();

}

class UpdateTextState extends State {

  String textErnstAngle = '0';

  double T1val = 0;
  double TRval = 0;


  changeText() {
    setState(() {
      T1val = double.tryParse(controllerT1.text) ?? 0;
      TRval = double.tryParse(controllerTR.text) ?? 0;
      textErnstAngle = ((180.0/pi)*acos(exp(-TRval/T1val))).toStringAsFixed(2);
    });
  }

  TextEditingController controllerT1 = TextEditingController();
  TextEditingController controllerTR = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(child:Column(
            children: <Widget>[
              const SizedBox(height: 15),
              // \theta_{E} = \arccos{\left(e^{-\frac{T_R}{T_1}}\right)}
              Image.asset(
                'assets/images/formula.png',
                width: 600,
                height: 100,
               ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('T1 = ', style: TextStyle(fontSize: 25),),
                    Container(
                      width: 150.0,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controllerT1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 25),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const Text(' ms',style: TextStyle(fontSize: 25),),
                  ]
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('TR = ',style: TextStyle(fontSize: 25),),
                    Container(
                      width: 150.0,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controllerTR,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 25),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const Text(' ms', style: TextStyle(fontSize: 25),),
                  ]
                ),
                 const SizedBox(height: 15),
                 ElevatedButton(
                  // onPressed: () => changeText(),
                   onPressed: () {
                     changeText();
                     FocusScope.of(context).unfocus();
                   },
                  child: const Text('Calculate', style: TextStyle(fontSize: 25),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Ernst Angle = $textErnstAngle degrees',style: const TextStyle(fontSize: 25),),
                    // const Text('Ernst Angle = ',style: TextStyle(fontSize: 25),),
                    // Text('$textErnstAngle',style: TextStyle(fontSize: 25),),
                    // const Text(' degrees',style: TextStyle(fontSize: 25),),
                  ]
                ),
              ],
            ),),
    );
  }
}




