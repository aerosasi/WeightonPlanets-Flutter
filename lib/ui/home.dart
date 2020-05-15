import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController _userweight = new TextEditingController();
  TextEditingController _resultweight = new TextEditingController();
  double result=0;
  String formattedText="Please Enter your Weight";
  int radiovalue=0;
  void radiochange(int value){
      setState(() {
        radiovalue=value;
        if(_userweight.text.isNotEmpty) {
          switch (radiovalue) {
            case 0:
              result = int.parse((_userweight.text).toString()) * 0.91;
              formattedText="Your Weight in Venus is ${result.toStringAsFixed(1)} ";
              break;
            case 1:
              result = int.parse((_userweight.text).toString()) * 0.06;
              formattedText="Your Weight in Pluto is ${result.toStringAsFixed(1)}";
              break;
            case 2:
              result = int.parse((_userweight.text).toString()) * 1.19;
              formattedText="Your Weight in Neptune is ${result.toStringAsFixed(1)}";
              break;

          }
        }
      });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: new Text("Weight on Planet X"),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(10)),
          new Image.asset(
            'images/planet2.png',
            width: 300,
            height: 200,
          ),
          new Container(
            color: Colors.white,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(left: 20, bottom: 10, right: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _userweight,
              decoration: new InputDecoration(
                labelText: "Enter your Earth Weight",
                hintText: "In Pounds",
                icon: new Icon(Icons.airline_seat_legroom_normal),
              ),
            ),
          ),
          new Padding(padding: EdgeInsets.all(5)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Radio(
                 activeColor:Colors.orange , value: 0, groupValue: radiovalue, onChanged: radiochange),
              new Text("Venus" ,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
              new Radio(activeColor: Colors.white, value: 1, groupValue: radiovalue, onChanged: radiochange),
              new Text("Pluto" ,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
              new Radio( activeColor: Colors.lightBlue, value: 2, groupValue: radiovalue, onChanged: radiochange),
              new Text("Neptune" ,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
            ],
          ),





          new Container(
            alignment: Alignment.center,
            child: new Text("$formattedText lbs "),
          )
        ],
      ),
      backgroundColor: Colors.deepOrange,
    );
  }
}
