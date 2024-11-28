import 'dart:async';

class TimerUtil {
  Timer? _timer;
  int _seconds = 0;

  // Timer duration in seconds (e.g., 3 minutes = 180 seconds)
  void startCountdown(int seconds, Function(String) onTimeUpdate,
      {Function? onTimerComplete}) {
    _seconds = seconds;
    _timer?.cancel(); // cancel any previous timer

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
        final seconds = (_seconds % 60).toString().padLeft(2, '0');
        onTimeUpdate('$minutes:$seconds');
      } else {
        _timer?.cancel();
        if (onTimerComplete != null) {
          onTimerComplete();
        }
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  bool isRunning() => _timer?.isActive ?? false;
}
