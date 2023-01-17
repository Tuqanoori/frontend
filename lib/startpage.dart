import 'package:flutter/material.dart';
import 'package:housen/home.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
      body: Shimmer(
        // This is the ONLY required parameter
        child: Container(
          color: Colors.white,
        ),
        // This is the default value
        duration: Duration(seconds: 1),
        // This is NOT the default value. Default value: Duration(seconds: 0)
        interval: Duration(seconds: 1),
        // This is the default value
        color: Colors.black45,
        // This is the default value
        colorOpacity: 0.3,
        // This is the default value
        enabled: true,
        // This is the default value
        direction: ShimmerDirection.fromRBLT(),
      ),
    ));
  }
}
