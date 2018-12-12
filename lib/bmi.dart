import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  double bmi = 0.0;
  String _weightStatus = "";
  final TextEditingController _nameField = new TextEditingController();
  final TextEditingController _heightField = new TextEditingController();
  final TextEditingController _weightField = new TextEditingController();

  void _onClick() {
    setState(() {
      bmi = calculate();
      if (bmi < 18.5)
        _weightStatus = "UnderWeight";
      else if (bmi < 25.0)
        _weightStatus = "Normal";
      else if (bmi < 30)
        _weightStatus = "OverWeight";
      else
        _weightStatus = "Obese!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        padding: EdgeInsets.only(top: 12.0),
        children: <Widget>[
          new Image.asset(
            "./images/bmilogo.png",
            alignment: Alignment.topCenter,
            height: 130.0,
            width: double.maxFinite,
          ),
          //tEXT fEILD
          new Container(
            //color: Colors.pink,
            padding: EdgeInsets.all(10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  controller: _nameField,
                  decoration: InputDecoration(
                    icon: new Icon(Icons.person),
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Enter Your Age",
                  ),
                  keyboardType: TextInputType.number,
                ),
                new TextField(
                  controller: _heightField,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.table_chart),
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: "Enter Your Height",
                      hintText: "In cm"),
                  keyboardType: TextInputType.number,
                ),
                new TextField(
                  controller: _weightField,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.line_weight),
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: "Enter Your Weight",
                      hintText: "In Kgs"),
                  keyboardType: TextInputType.number,
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                new Center(
                  child: new RaisedButton(
                    child: new Text("Calculate"),
                    color: Colors.greenAccent,
                    onPressed: _onClick,
                    splashColor: Colors.greenAccent,
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                        bmi > 0.0 ? "Your BMI: ${bmi.toStringAsFixed(2)}" : " ",
                        style: new TextStyle(
                            fontSize: 50,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent)),
                    new Text(bmi > 0.0 ? _weightStatus : " ",
                        style: new TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.redAccent))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculate() {
    if (_heightField.text.isNotEmpty && _weightField.text.isNotEmpty) {
      double a = double.parse(_heightField.text);
      double b = double.parse(_weightField.text);
      a *= a;
      return ((b / a) * 10000);
    } else
      return 0.0;
  }
}
