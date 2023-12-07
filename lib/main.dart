import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inherited_state_flutter/colors_inherited_model/colors_widget.dart';
import 'package:inherited_state_flutter/inherited_notifier.dart';
import 'package:inherited_state_flutter/inherited_widget%20.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited State',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      ),
      home: const HomePage(),
      routes: {
        '/inherited-notifier': (context) => const NotifierInherited(),
        '/inherited-widget': (context) => const WidgetInherited(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited State'),
      ),
      body: Column(
        children: [
          ColorsWidget(),
        ],
      ),
    );
  }
}
