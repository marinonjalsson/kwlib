// ignore_for_file: public_member_api_docs

import 'package:kwlib/src/flow/flow_pipe.dart';

/// Very simple flow.
/// Used just send events with no data.
/// Ideal for simple ui updates.
class FlowUpdate extends FlowPipe<void> {
  FlowUpdate({
    super.i,
  });

  void update() => pipe(null);
}
