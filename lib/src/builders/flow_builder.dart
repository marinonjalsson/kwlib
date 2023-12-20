import 'package:flutter/material.dart';
import 'package:klib/flow.dart';

/// FlowBuilder with one FlowRam
class FlowBuilder<T> extends StatefulWidget {
  ///
  const FlowBuilder({required this.flowPipe, required this.builder, super.key});

  ///
  final Widget Function(T?) builder;

  ///
  final FlowPipe<T> flowPipe;

  @override
  State<FlowBuilder<T>> createState() => _FlowBuilderState<T>();
}

class _FlowBuilderState<T> extends State<FlowBuilder<T>> {
  late final FlowCtl<T> flowCtl;

  @override
  void initState() {
    flowCtl = widget.flowPipe.asFlowCtl();
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
        //initialData: widget.flowRam.value,
        builder: (_, AsyncSnapshot<T> snapshot) {
          final value = snapshot.data; //?? widget.flowRam.value;
          return widget.builder(value);
        },
      );
}
