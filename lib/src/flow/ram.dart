import 'package:kwlib/src/flow/flow_ram.dart';

/// Can be use as parent class for *Ram class mixted with *Bloc.
abstract class Ram {
  /// Can be used to update all the page.
  final ui = FlowRam<void>(null);
}
