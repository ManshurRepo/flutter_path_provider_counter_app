// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_path_provider/counter_file_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Read Write Path_Provider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _getDataCounter() async {
    _counter = await CounterFileStorage().readCounter();
    setState(() {});
  }

  void _incrementCounter() async {
    await CounterFileStorage().writeCounter(++_counter);
    _getDataCounter();
  }

  void _decrementCounter() async {
    await CounterFileStorage().writeCounter(--_counter);
    _getDataCounter();
  }

  void _removeCounter() async {
    await CounterFileStorage().writeCounter(0);
    _getDataCounter();
  }

  @override
  void initState() {
    super.initState();
    _getDataCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter Example From Directory'),
          SizedBox(height: 8),
          Text('$_counter'),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Text('-'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('+'),
              ),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              _removeCounter();
            },
            child: Text('Clear'),
          )
        ],
      )),
    );
  }
}
