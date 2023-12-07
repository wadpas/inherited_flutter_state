import 'package:flutter/material.dart';
import 'package:inherited_state_flutter/date_time_inherited_widget/api_provider.dart';
import 'package:uuid/uuid.dart';

class DateTimeInherited extends InheritedWidget {
  final ApiProvider dateTimeApi;
  final String uuid;

  DateTimeInherited({
    Key? key,
    required this.dateTimeApi,
    required Widget child,
  })  : uuid = const Uuid().v4(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant DateTimeInherited oldWidget) {
    return uuid != oldWidget.uuid;
  }

  static DateTimeInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DateTimeInherited>()!;
  }
}
