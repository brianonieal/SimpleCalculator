import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Hwk12));
}

class Hwk12 extends StatefulWidget {
  @override
  _Hwk12State createState() => _Hwk12State();
}

late TextEditingController _value1Controller, _value2Controller;
late String _message;

@override
void initState() {
  super.initState();
  _message = "0.00";
  _value1Controller = TextEditingController();
  _value2Controller = TextEditingController();

}
Widget _buildValue1TextField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: TextField(
      controller: _value1Controller,
      decoration: InputDecoration(labelText: 'Number1: '),
      keyboardType: TextInputType.number,
    ),
  );
}

Widget _buildValue2TextField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: TextField(
      controller: _value2Controller,
      decoration: InputDecoration(labelText: 'Number2: '),
      keyboardType: TextInputType.number,
    ),
  );
}

@override
void dispose() {
  // TODO: implement dispose
  super.dispose();
  _value1Controller.dispose();
  _value2Controller.dispose();
}

void _calcUpdate(String opr) {
  setState(() {
    final double value1 = double.parse(_value1Controller.text);
    final double value2 = double.parse(_value2Controller.text);
    switch(opr){
      case "+" :  {
        _message = (value1 + value2).toString();
      } break;
      case "-" : {
        _message = (value1 - value2).toString();
      } break;
      case "*" : {
        _message = (value1 * value2).toString();
      } break;
      case "/" : {
        _message = (value1 / value2).toString();
      } break;
    }

  });
}

class _Hwk12State extends State<Hwk12> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text("$_message", style: TextStyle(fontSize: 35,),)
          ),
        Divider(height: 4, color: Colors.grey, thickness: 5, ),
        _buildValue1TextField(),
        _buildValue2TextField(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calcUpdate("+");
                    });
                }, child: Text("+")),

              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calcUpdate("-");
                    });
                }, child: Text("-")),

              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calcUpdate("*");
                    });
                }, child: Text("*", style: TextStyle(fontSize: 20,),)),

              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calcUpdate("/");
                    });
                }, child: Text("/", style: TextStyle(fontSize: 20,),)),

            ],
      )
        ],
    ),
      ),
    );
  }
}