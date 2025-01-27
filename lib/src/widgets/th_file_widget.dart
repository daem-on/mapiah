import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mapiah/main.dart';
import 'package:mapiah/src/auxiliary/mp_log.dart';
import 'package:mapiah/src/elements/th_file.dart';
import 'package:mapiah/src/stores/th2_file_edit_store.dart';
import 'package:mapiah/src/widgets/mp_non_selected_elements_widget.dart';
import 'package:mapiah/src/widgets/mp_selected_elements_widget.dart';
import 'package:mapiah/src/widgets/mp_selection_window_widget.dart';

class THFileWidget extends StatelessWidget {
  final TH2FileEditStore th2FileEditStore;

  late final THFile thFile = th2FileEditStore.thFile;
  late final int thFileMapiahID = th2FileEditStore.thFileMapiahID;

  THFileWidget({required super.key, required this.th2FileEditStore});

  @override
  Widget build(BuildContext context) {
    getIt<MPLog>().finer("THFileWidget.build()");
    return LayoutBuilder(
      builder: (context, constraints) {
        th2FileEditStore.updateScreenSize(
            Size(constraints.maxWidth, constraints.maxHeight));

        if (th2FileEditStore.canvasScaleTranslationUndefined) {
          th2FileEditStore.zoomAll();
        }

        return Observer(
          builder: (context) {
            getIt<MPLog>().finer("THFileWidget Observer()");

            return GestureDetector(
              onTapUp: _onTapUp,
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: Stack(
                children: [
                  MPNonSelectedElementsWidget(
                    key:
                        ValueKey("MPNonSelectedElementsWidget|$thFileMapiahID"),
                    th2FileEditStore: th2FileEditStore,
                  ),
                  MPSelectedElementsWidget(
                    key: ValueKey("MPSelectedElementsWidget|$thFileMapiahID"),
                    th2FileEditStore: th2FileEditStore,
                  ),
                  MPSelectionWindowWidget(
                    key: ValueKey("MPSelectionWindowWidget|$thFileMapiahID"),
                    th2FileEditStore: th2FileEditStore,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _onTapUp(TapUpDetails details) {
    th2FileEditStore.onTapUp(details);
  }

  void _onPanStart(DragStartDetails details) {
    th2FileEditStore.onPanStart(details);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    th2FileEditStore.onPanUpdate(details);
  }

  void _onPanEnd(DragEndDetails details) {
    th2FileEditStore.onPanEnd(details);
  }
}
