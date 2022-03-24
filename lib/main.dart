import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List nombres = [];
  // ignore: close_sinks
  final StreamController<String> streamController = StreamController<String>();
  final nombresController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: <Widget>[
              SafeArea(
                child: Container(
                  height: 300,
                  child: StreamBuilder(
                      stream: streamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          nombres.add(snapshot.data!);
                        }
                        return ListView.builder(
                            itemCount: nombres.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text('${nombres[index]}'),
                                ],
                              );
                            });
                      }),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: nombresController,
                      ),
                    ),
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(width: 3),
                      ),
                      child: Text('Agregar',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () async {
                        if (nombres.length >= 15) {
                          nombres.clear();
                        }
                        nombres.add(nombresController.text);
                        setState(() {});
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
