import 'dart:async';

typedef EasyThrottleCallback = void Function();

class _EasyThrottleOperation {
  EasyThrottleCallback callback;
  EasyThrottleCallback? onAfter;
  Timer timer;

  _EasyThrottleOperation(
    this.callback,
    this.timer, {
    this.onAfter,
  });
}

class EasyThrottle {
  static Map<String, _EasyThrottleOperation> _operations = {};

  /// Will execute [onExecute] immediately and ignore additional attempts to
  /// call throttle with the same [tag] happens for the given [duration].
  ///
  /// [tag] is any arbitrary String, and is used to identify this particular throttle
  /// operation in subsequent calls to [throttle()] or [cancel()].
  ///
  /// [duration] is the amount of time subsequent attempts will be ignored.
  ///
  /// Returns whether the operation was throttled
  static bool throttle(
    String tag,
    Duration duration,
    EasyThrottleCallback onExecute, {
    EasyThrottleCallback? onAfter,
  }) {
    var throttled = _operations.containsKey(tag);
    if (throttled) {
      return true;
    }

    _operations[tag] = _EasyThrottleOperation(
      onExecute,
      Timer(duration, () {
        _operations[tag]?.timer.cancel();
        _EasyThrottleOperation? removed = _operations.remove(tag);

        removed?.onAfter?.call();
      }),
      onAfter: onAfter,
    );

    onExecute();

    return false;
  }

  /// Cancels any active throttle with the given [tag].
  static void cancel(String tag) {
    _operations[tag]?.timer.cancel();
    _operations.remove(tag);
  }

  /// Cancels all active throttles.
  static void cancelAll() {
    for (final operation in _operations.values) {
      operation.timer.cancel();
    }
    _operations.clear();
  }

  /// Returns the number of active throttles
  static int count() {
    return _operations.length;
  }
}
