import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  void scrollBackTap() {
    _controller.animateTo(0.0,
        curve: Curves.linear, duration: Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              child: FlatButton(
                onPressed: () {
                  scrollBackTap();
                },
                child: Text(
                  "Başa dön",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 200,
                    itemExtent: 30,
                    controller: _controller,
                    itemBuilder: (_, index) {
                      return Text("Sıra: $index");
                    }))
          ],
        ),
      ),
    );
  }
}
