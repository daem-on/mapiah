import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mapiah/src/painters/mp_selection_handles_painter.dart';
import 'package:mapiah/src/stores/th2_file_edit_store.dart';

class MPSelectionHandlesWidget extends StatelessWidget {
  final TH2FileEditStore th2FileEditStore;
  final int thFileMapiahID;

  MPSelectionHandlesWidget({
    required this.th2FileEditStore,
    required super.key,
  }) : thFileMapiahID = th2FileEditStore.thFileMapiahID;

  @override
  Widget build(Object context) {
    return RepaintBoundary(
      child: Observer(
        builder: (_) {
          if (th2FileEditStore.selectedElements.isEmpty) {
            return const SizedBox.shrink();
          }
          final List<Rect> handles = th2FileEditStore.selectionHandles;
          final Paint handlesFillPaint =
              th2FileEditStore.selectionHandlesFillPaint.value;
          return CustomPaint(
            painter: MPSelectionHandlesPainter(
              th2FileEditStore: th2FileEditStore,
              handles: handles,
              fillPaint: handlesFillPaint,
            ),
          );
        },
      ),
    );
  }
}
