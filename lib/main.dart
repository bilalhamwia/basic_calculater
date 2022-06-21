// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_interpolations



import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  
  operation (String btntext){
      if(btntext == "c")
      {
        _output = "0";
        num2 = 0.0;
        num1 = 0.0;
        operand = "";
      }
      else if(btntext == "+" || btntext == "-" || btntext == "x" || btntext == "/")
      {
        num1 = double.parse(output);
        operand = btntext;
        _output = "0";
      }
      else if(btntext == "=")
      {
        num2 = double.parse(output);

        if(operand == "+")
        {
          _output = (num1 + num2).toString();
        }
        if(operand == "-")
        {
          _output = (num1 - num2).toString();
        }
        if(operand == "x")
        {
          _output = (num1 * num2).toString();
        }
        if(operand == "/")
        {
          _output = (num1 / num2).toString();
        }

        num1 = 0.0;
        num2 = 0.0;
        operand = "";

      }

      else
      {
        _output = _output + btntext;
      }

      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });


  }


  Widget button(String btntext){
    return Expanded(
                    child: RawMaterialButton(
                      shape: Border.all(color: Colors.black,width: 1),
                      fillColor: btntext == '=' || btntext == '/'|| btntext == 'x'|| btntext == 'c' || btntext == '+' || btntext == '-'? Colors.orangeAccent[700] :Colors.black,
                      
                      padding: EdgeInsets.all(30),
                      splashColor: Colors.yellowAccent,
                      child: Text(
                        "$btntext",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                      onPressed: (){
                        operation(btntext);
                      },
                    ),
                  );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black,width: 2),
                    color: Colors.black12 //bordar output
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "$output",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                ),
              ),
              Row(
                children: [
                  button("9"),
                  SizedBox(
                    width: 5,
                  ),
                  button("8"),
                  SizedBox(
                    width: 5,
                  ),
                  button("7"),
                  SizedBox(
                    width: 5,
                  ),
                  button("/"),
                  
                ],
                
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("4"),
                  SizedBox(
                    width: 5,
                  ),
                  button("5"),
                  SizedBox(
                    width: 5,
                  ),
                  button("6"),
                  SizedBox(
                    width: 5,
                  ),
                  button("x"),
                  
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("3"),
                  SizedBox(
                    width: 5,
                  ),
                  button("2"),
                  SizedBox(
                    width: 5,
                  ),
                  button("1"),
                  SizedBox(
                    width: 5,
                  ),
                  button("-"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button("c"),
                  SizedBox(
                    width: 5,
                  ),
                  button("0"),
                  SizedBox(
                    width: 5,
                  ),
                  button("="),
                  SizedBox(
                    width: 5,
                  ),
                  button("+"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}