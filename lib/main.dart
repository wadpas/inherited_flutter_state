import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inherited_state_flutter/colors_inherited_model/colors_widget.dart';
import 'package:inherited_state_flutter/date_time_inherited_widget/api_provider.dart';
import 'package:inherited_state_flutter/date_time_inherited_widget/date_time_widget.dart';
import 'package:inherited_state_flutter/inherited_notifier.dart';
import 'package:inherited_state_flutter/date_time_inherited_widget/date_time_inherited.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
              child: ColorsWidget(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: DateTimeInherited(
                dateTimeApi: ApiProvider(),
                child: const DateTimeWidget(),
              ),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: NotifierInherited(),
            )
          ],
        ),
      ),
    );
  }
}
