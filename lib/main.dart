import 'package:flutter/material.dart';
import 'package:housen/startpage.dart';

void main() {
  runApp(MaterialApp(home: myapp()));
}

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  void initState() {
    // TODO: implement initState
    super.initState();

    go();
  }

  Future go() async {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StartPage()),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Scaffold(
        body:Center(child:
        Image.asset(
          'image/Group (1).png',
          fit: BoxFit.contain,
          width: 300,
          height: 50,
        ),
          )
      )


    );}}

