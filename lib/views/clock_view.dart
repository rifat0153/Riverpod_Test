import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/controllers/clock_controller.dart';
import 'package:intl/intl.dart';

class ClockView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch ) {
    final clockControllerState = watch(clockControllerProvider);

    final formattedDate = DateFormat.Hms().format(clockControllerState
        .maybeWhen(data: (data) => data, orElse: () => DateTime.now()));
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(formattedDate),
      ),
    );
  }
}
