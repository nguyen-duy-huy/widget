import 'package:flutter/material.dart';
import 'dart:math';

class MyObject {
  int value;

  MyObject({
    required this.value,
  });

  void printValue() {
    print("MyObject value: $value");
  }

  void increase() {
    value++;
  }

  void decrease() {
    value--;
  }

  void square() {
    value = value * value;
  }

  int power(int exponent) {
    return pow(value, exponent).toInt();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyObject _myObject = MyObject(value: 0);
  final TextEditingController _exponentController = TextEditingController();

  void _updateValue(Function operation) {
    setState(() {
      operation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '${_myObject.value}',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
            onPressed: () => _updateValue(() => _myObject.increase()),
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () => _updateValue(() => _myObject.decrease()),
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: () => _updateValue(() => _myObject.square()),
            child: const Text('Square'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: TextField(
                    controller: _exponentController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nhập số N',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _updateValue(
                    () => _myObject.power(
                      int.tryParse(_exponentController.text) ?? 0,
                    ),
                  ),
                  child: const Text('Calculate Power'),
                ),
              ],
            ),
          ),
          Text(
            'Lũy thừa bậc N:  ${_myObject.power(int.tryParse(_exponentController.text) ?? 0)}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}