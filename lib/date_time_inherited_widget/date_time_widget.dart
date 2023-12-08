import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:inherited_flutter_state/date_time_inherited_widget/date_time_inherited.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({super.key});

  @override
  State<DateTimeWidget> createState() => _DatePageState();
}

class _DatePageState extends State<DateTimeWidget> {
  ValueKey _textKey = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    final dateTimeApi = DateTimeInherited.of(context).dateTimeApi;
    return GestureDetector(
      onTap: () async {
        final dateTime = await dateTimeApi.getDateAndTime();
        setState(() {
          _textKey = ValueKey(dateTime);
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('InheritedWidget'),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.amberAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Current date & time'),
                    Text(
                      dateTimeApi.dateTime == null
                          ? "Tap screen"
                          : DateFormat("dd.MM.yyyy hh:mm:ss").format(
                              DateTime.parse(dateTimeApi.dateTime!),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
