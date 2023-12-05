import 'dart:collection';
import 'package:kwlib/src/flow/flow_pipe.dart';

///
class FlowRam<T> extends FlowPipe<T> {
  ///
  FlowRam(
    T init, {
    this.historyLength = 6,
    super.i,
  }) : _data = init;

  ///
  final int historyLength;
  T _data;

  final Queue<T> _history = Queue();

  ///
  T get value => _data;

  ///
  Queue<T> get history => _history;

  ///
  void notifyAll() {
    super.pipe(value);
  }

  ///
  bool isSame(T other) => value == other;

  ///
  bool isNotSame(T other) => !isSame(other);

  ///
  void set(T value) {
    _data = value;
    if (0 < historyLength) {
      _history.addFirst(_data);
      if (historyLength < _history.length) {
        _history.removeLast();
      }
    }
    super.pipe(value);
  }
}
