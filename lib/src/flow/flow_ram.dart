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
  //final List<FlowCtl<T>> _flowCtls = [];

  /// The log callback if used.
  //final void Function(dynamic)? i;

  ///
  final int historyLength;
  T _data;

  final Queue<T> _history = Queue();

  ///
  //void addFlowCtl(FlowCtl<T> flowCtl) => _flowCtls.add(flowCtl);

  ///
  //void removeFlowCtl(FlowCtl<T> flowCtl) => _flowCtls.remove(flowCtl);

  ///
  //FlowCtl<T> asFlowCtl({bool brodcast = false}) => FlowCtl<T>(
  //      this,
  //      brodcast: brodcast,
  //    );

  ///
  T get value => _data;

  ///
  Queue<T> get history => _history;

  ///
  void notifyAll() {
    if (i != null) {
      // THE LOG
      // ignore: prefer_null_aware_method_calls
      i!(value);
    }
    _notifyAll();
  }

  ///
  bool isSame(T other) => value == other;

  ///
  bool isNotSame(T other) => !isSame(other);

  ///
  void set(T value) {
    _data = value;
    if (i != null) {
      // ignore: prefer_null_aware_method_calls
      i!(value);
    }
    if (0 < historyLength) {
      _history.addFirst(_data);
      if (historyLength < _history.length) {
        _history.removeLast();
      }
    }
    _notifyAll();
  }

  void _notifyAll() {
    super.pipe(value);
    //for (final ctl in _flowCtls) {
    //  ctl.add(data: value);
    //}
  }
}
