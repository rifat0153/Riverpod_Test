import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final clockControllerProvider =
    StateNotifierProvider<ClockController, AsyncValue<DateTime>>((ref) {
  return ClockController();
});

class ClockController extends StateNotifier<AsyncValue<DateTime>> {
  ClockController() : super(AsyncValue.loading()) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      state = AsyncValue.data(DateTime.now());
    });
  }

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
