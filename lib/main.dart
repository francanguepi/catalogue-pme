import 'dart:async';
import 'package:flutter/material.dart';
import 'package:catalogue_pme/views/login.dart';
import 'package:catalogue_pme/views/searchEnterprise.dart';
import 'package:catalogue_pme/globalVariable.dart' as variable;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override


  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchEnterprise()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    return Scaffold(
      body: new Container(
        width: double.infinity,
        color: variable.blueMainColor,
        child: new Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                'images/logo-long.png',
                  height: 250.0,
                  width: 250.0
              ),
              SizedBox(height: (hauteur/2) - 125),
              new Text(
                "power by SmE Solutions",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200
                ),
              ),
            ],
          ),
        )
      ),

    );
  }

/*new Align(
              alignment: Alignment.center,
              child: Image.asset('images/logo-long.png',),
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Text("power by SmE Solutions"),
            )*/
/*child: new Align(
          alignment: Alignment.center,
          child: Image.asset('images/logo-long.png',),
        ),*/
}
