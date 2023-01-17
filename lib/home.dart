import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:http/http.dart' as http;
import 'jsondata/data.dart';
import 'listveiwhome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* void initState() {
    fetchData();
    super.initState();
  }
  void fetchData(List<String> arguments) async {
    var url = 'https://jsonplaceholder.typicode.com/users';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }*/

  bool isDarkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Day / night switcher example',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(color: const Color(0xFFFFFFFF)),
          scaffoldBackgroundColor: const Color(0xFF15202B),
        ),
        themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(
            body: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              'image/Group (1).png',
                              fit: BoxFit.contain,
                              width: 120,
                              height: 40,
                            ),
                            DayNightSwitcherIcon(
                              isDarkModeEnabled: isDarkModeEnabled,
                              onStateChanged: (isDarkModeEnabled) {
                                setState(() {
                                  this.isDarkModeEnabled = isDarkModeEnabled;
                                });
                              },
                            ),
                          ]),
                      Text(
                        'Find your ideal home !',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Custemerlistviewhome(),
                      SizedBox(
                        height: 5,
                      ),
                      ListofCity(),
                    ]))))));
  }

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }

  Widget SearchBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Positioned.fill(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "  Search for address",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black12,
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),

                  ),
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      data = data.where((data) {
                        var noteTittle = data['city']!.toLowerCase();
                        return noteTittle.contains(text);
                      }).toList();
                    });
                  },
                ))),
        SizedBox(
          height: 5,
        ),
        SizedBox(
            height: 50, //height of button
            width: 380, //width of button equal to parent widget
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigoAccent,
                  //background color of button
                  side: BorderSide(width: 3, color: Colors.white10),
                  //border width and color
                  elevation: 3,
                  //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10) //content padding inside button
                  ),
              onPressed: () {},
              child: Text('Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  )),
            )),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget ListofCity() {
    return Expanded(

        child: Container(
            height: 450,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0 ? SearchBottom() : listItme(index - 1);
                })));
  }

  listItme(index) {
    return Card(
       //color: Colors.transparent,
        elevation: 2,
        child: Padding(
      padding: EdgeInsets.fromLTRB(32.0, 32.0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(data[index]['city'].toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                )),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.black26,
            ),
          ]),
          Row(children:[Image.asset('image/Union (1).png',height: 5,width: 5,),Text(data[index]['street'].toString(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
                fontWeight: FontWeight.normal,
              )),]),
          Text(data[index]['suite'].toString(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
                fontWeight: FontWeight.normal,
              ))
        ],
      ),
    ));
  }
}
