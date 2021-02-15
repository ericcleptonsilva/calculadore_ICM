import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final HomeComponetes;
  // ignore: non_constant_identifier_names
  HomePage({this.HomeComponetes});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Textinfor01 = "Calculadora de IMC";
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _inforText = "Informe seus dados!";

  void _resetFields() {
    pesoController.text = "";
    alturaController.text = "";
    _inforText = "Informe seus dados!";
  }

  void _calculate() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      print(imc);
      if (imc < 18.6) {
        _inforText = "Abaixo do peso! \n(Imc = ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _inforText = "Peso ideal! \n(Imc = ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _inforText =
            "Acima do peso! \n(Imc = ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _inforText =
            "Obesidade grau 01! \n(Imc = ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _inforText =
            "Obesidade grau 02! \n(Imc = ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _inforText =
            "Obesidade grau 03! \n(Imc = ${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Textinfor01,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              ),
              onPressed: _resetFields)
        ],
      ),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  _inforText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (Cm)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 70, right: 70, top: 10),
                child: Container(
                  height: 55,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    elevation: 5,
                    onPressed: _calculate,
                    child: Text(
                      "Calulcar",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
