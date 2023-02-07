import 'dart:async';
import 'dart:html';
import 'dart:js' as JS;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Timer? timer;

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Color _bgColor = Colors.white;
  Color _textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    JS.context['incrementCounter'] = () {
      _incrementCounter();
    };
    JS.context['clearCounter'] = () {
      setState(() {
        _counter = 0;
        _send('counter', {
          'counter': _counter
        });
      });
    };
    JS.context['setColor'] = (String bgColor, String textColor) {
      setState(() {
        _bgColor = bgColor.toColor().withOpacity(0.5);
        _textColor = textColor.toColor();
        Timer(const Duration(milliseconds: 50), () => {
          _send('setColor', {
            'bgColor': bgColor,
            'textColor': textColor,
          })
        });
      });
    };
    _send('init');
  }

  void _send(String action, [dynamic data]) {
    var event = CustomEvent('framescript:action', detail: {
      'action': action,
      'data': data ?? {}
    });
    document.dispatchEvent(event);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _send('counter', {
        'counter': _counter
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyMedium?.apply(color: _textColor),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.apply(color: _textColor),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _bgColor,
        onPressed: () {
          timer?.cancel();
          timer = Timer(const Duration(milliseconds: 50), _incrementCounter);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
