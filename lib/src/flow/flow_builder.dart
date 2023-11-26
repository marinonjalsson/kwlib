import 'package:flutter/material.dart';
import 'package:kwlib/src/flow/flow_ctl.dart';
import 'package:kwlib/src/flow/flow_ram.dart';

/// FlowBuilder with one FlowRam
class FlowBuilder<T> extends StatefulWidget {
  ///
  const FlowBuilder({required this.flowRam, required this.builder, super.key});

  ///
  final Widget Function(T) builder;

  ///
  final FlowRam<T> flowRam;

  @override
  State<FlowBuilder<T>> createState() => _FlowBuilderState<T>();
}

class _FlowBuilderState<T> extends State<FlowBuilder<T>> {
  late final FlowCtl<T> flowCtl;

  @override
  void initState() {
    flowCtl = widget.flowRam.asFlowCtl();
    super.initState();
  }

  @override
  void dispose() {
    flowCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<T>(
        stream: flowCtl.stream,
        initialData: widget.flowRam.value,
        builder: (_, AsyncSnapshot<T> snapshot) {
          final value = snapshot.data ?? widget.flowRam.value;
          return widget.builder(value);
        },
      );
}
