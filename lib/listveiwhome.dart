import 'package:flutter/material.dart';

Widget  Custemerlistviewhome(){

  return Expanded(child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children:[ Row(children:[
        Container(
            child:Image.asset(
          'image/Rectangle 1.png',
          fit: BoxFit.contain,
          width: 350,
          height: 200,

        )),
  SizedBox(width: 20,),
  ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Container(
          child:Image.asset(
          'image/home2.jpg',
          fit: BoxFit.contain,
          width: 350,
          height: 200,
        ),)
  )])]));}
