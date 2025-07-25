import 'dart:async';
import 'dart:ui';

class SearchDebouncer {
  final Duration delay;
  VoidCallback? _action;
  Timer? _timer;

  SearchDebouncer({this.delay = const Duration(milliseconds: 500)});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
