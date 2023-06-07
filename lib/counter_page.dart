import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CounterState>(builder: (context, state, child) {
              print('Cunsumer ${state.counter} ${state.name}');
              return Text('Couter ${state.counter} ${state.name}');
            }),
            Selector<CounterState, String>(
              selector: (context, controller) => controller.name,
              builder: (context, name, child) {
                print('Name ${name}');
                return Text(
                  name.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Selector<CounterState, int>(
              selector: (context, controller) => controller.counter,
              builder: (context, counter, child) {
                print('Counter ${counter}');
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterController>().add(5);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
