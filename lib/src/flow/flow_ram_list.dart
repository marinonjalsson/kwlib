import 'package:kwlib/src/flow/flow_pipe.dart';

///
class FlowRamList<T> extends FlowPipe<List<T>> {
  ///
  FlowRamList({
    super.i,
  });

  ///
  List<T> get list => <T>[];

  ///
  void add(T item) {
    list.add(item);
    super.pipe(list);
  }

  ///
  bool remove(T item) {
    final result = list.remove(item);
    super.pipe(list);
    return result;
  }

  ///
  void clear() {
    list.clear();
    super.pipe(list);
  }
}
