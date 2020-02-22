import 'package:flutter/material.dart';
import 'dart:math';
void main(){
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,

        appBar:AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('Dicee',
          style: TextStyle(color:Colors.blue, fontSize: 30.0, fontWeight: FontWeight.bold),

           ),
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNo = 1;
  int rightDiceNo = 1;

  void changeDiceFace() {
    setState(() {
      rightDiceNo = Random().nextInt(6) + 1;
      leftDiceNo = Random().nextInt(6) + 1;
    });
  }
  _onSubmit() {
    if (leftDiceNo==rightDiceNo) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Congratulations')),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children : <Widget>[
                Expanded(
                  child: Text('You are a winner',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,

                    ),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                   // _inputTextController.clear();
                    Navigator.of(context).pop();
                  })
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed:(){
                  changeDiceFace();
                  _onSubmit();
                },
                child: Image.asset('images/dice$leftDiceNo.png')),
          ),


          Expanded(
            child: FlatButton(
                onPressed:(){
                  changeDiceFace();
                  _onSubmit();
                },
                child: Image.asset('images/dice$rightDiceNo.png')),
          ),

        ],
      ),
    );


  }
}
