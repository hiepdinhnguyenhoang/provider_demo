import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/counter_controller.dart';
import 'package:provider_demo/counter_page.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StateNotifierProvider<CounterController, CounterState>(
        create: (BuildContext context) {
          return CounterController();
        },
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
