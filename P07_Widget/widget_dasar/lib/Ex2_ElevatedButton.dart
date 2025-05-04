import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Handling App',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        title: const Text('Demo Event Handling'),
      ),
      body: const Center(
        child: HelloButton(),
      ),
    );
  }
}

class HelloButton extends StatelessWidget {
  const HelloButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  Text('Hello'),
      onPressed: () {
        action(context);
      },
    );
  }
}

void action(BuildContext context) {
  var alertDialog =  AlertDialog(
    title: Text('Event-Handling'),
    content: Text('Hello World!',
     style:TextStyle(fontWeight: FontWeight.bold),),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
