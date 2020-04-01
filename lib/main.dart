import 'package:flutter/material.dart';

void main(){
runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: "Calculadora",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int firnum;
  int secondnum;
  String texttodisplay = "";
  String result;
  String operationtoperform;

  void btnclicked(String btntext){
    if (btntext == "AC") {
      texttodisplay = "";
      firnum = 0;
      secondnum = 0;
      result = "";
    }else if (btntext == "+" || btntext == "-" || btntext == "*" || btntext == "/") {
      firnum = int.parse(texttodisplay);
      result = "";
      operationtoperform = btntext;
    }else if (btntext == "=") {
      secondnum = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        result = (firnum + secondnum).toString();
      }
      if (operationtoperform == "-") {
        result = (firnum - secondnum).toString();
      }
      if (operationtoperform == "*") {
        result = (firnum * secondnum).toString();
      }
      if (operationtoperform == "/") {
        result = (firnum ~/ secondnum).toString();
      }
    }else{
      result = int.parse(texttodisplay + btntext).toString();
    }

    setState(() {
      texttodisplay = result;
    });
  }

  Widget custombutton(String btnval){
      return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(25.0),
          onPressed: () => btnclicked(btnval),
          child: Text(
            "$btnval",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      );
    }


  @override
  Widget build(BuildContext context) {


    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("AC"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}