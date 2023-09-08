import 'package:flutter/material.dart';
import 'package:inherited_widget_flutter/inherited_model.dart';
import 'package:inherited_widget_flutter/inherited_notifier.dart';
import 'package:inherited_widget_flutter/inherited_widget%20.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Inherited Pattern',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/inherited-model': (context) => const ModelInherited(),
        '/inherited-notifier': (context) => const NotifierInherited(),
        '/inherited-widget': (context) => const WidgetInherited(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inherited Pattern')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/inherited-model');
            },
            child: const Text('Inherited Model'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/inherited-notifier');
            },
            child: const Text('Inherited Notifier'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/inherited-widget');
            },
            child: const Text('Inherited Widget'),
          ),
        ],
      ),
    );
  }
}
