import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inherited_flutter_state/colors_inherited_model/colors_widget.dart';
import 'package:inherited_flutter_state/date_time_inherited_widget/api_provider.dart';
import 'package:inherited_flutter_state/date_time_inherited_widget/date_time_widget.dart';
import 'package:inherited_flutter_state/opacity_inherited_notifier/opacity_widget.dart';
import 'package:inherited_flutter_state/date_time_inherited_widget/date_time_inherited.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ColorsWidget(),
            DateTimeInherited(
              dateTimeApi: ApiProvider(),
              child: const DateTimeWidget(),
            ),
            const OpacityWidget()
          ].expandEqually().toList(),
        ),
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map(
        (w) => Expanded(child: w),
      );
}
