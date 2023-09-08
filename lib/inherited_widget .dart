import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WidgetInherited extends StatelessWidget {
  const WidgetInherited({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiProvider(
      api: Api(),
      child: const HomePage(),
    );
  }
}

class ApiProvider extends InheritedWidget {
  final Api api;
  final String uuid;

  ApiProvider({
    Key? key,
    required this.api,
    required Widget child,
  })  : uuid = const Uuid().v4(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }

  static ApiProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>()!;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueKey _textKey = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApiProvider.of(context).api.dateAndTime ?? ''),
      ),
      body: GestureDetector(
        onTap: () async {
          final api = ApiProvider.of(context).api;
          final dateTime = await api.getDateAndTime();
          setState(() {
            _textKey = ValueKey(dateTime);
          });
        },
        child: SizedBox.expand(
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            child: TimeDate(key: _textKey),
          ),
        ),
      ),
    );
  }
}

class TimeDate extends StatelessWidget {
  const TimeDate({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.of(context).api;
    return Column(
      children: [
        Text(api.dateAndTime ?? "Tap screen"),
      ],
    );
  }
}

class Api {
  String? dateAndTime;

  Future<String> getDateAndTime() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => DateTime.now().toIso8601String(),
    ).then((value) {
      dateAndTime = value;
      return value;
    });
  }
}
