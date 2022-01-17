import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  TextEditingController myController = TextEditingController();
  String data = '';
  void getData() async{
    var url = "http://numbersapi.com/${myController.text}/math";
    final response = await get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'Charset': 'utf-8'
    });

    print(response.body);
     setState(() {
       data = jsonDecode(response.body)["text"];
     });
     print(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 200,
                height: 100,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: "Enter a number",
                  ),
                ),
              ),
            ),
            OutlinedButton(onPressed: () { getData(); }, child: Text('Press me'),),
            SizedBox(
              height: 20,
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
