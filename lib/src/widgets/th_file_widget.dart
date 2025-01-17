import 'package:flutter/material.dart';
import 'package:mapiah/main.dart';
import 'package:mapiah/src/elements/parts/th_point_interface.dart';
import 'package:mapiah/src/painters/th_file_painter.dart';
import 'package:mapiah/src/stores/th_file_display_store.dart';
import 'package:mapiah/src/elements/th_element.dart';
import 'package:mapiah/src/elements/th_point.dart';
import 'package:mapiah/src/pages/th2_file_edit_mode.dart';
import 'package:mapiah/src/stores/th_file_store.dart';

class THFileWidget extends StatefulWidget {
  final THFileStore thFileStore;

  THFileWidget(this.thFileStore);

  @override
  State<THFileWidget> createState() => _THFileWidgetState();
}

class _THFileWidgetState extends State<THFileWidget> {
  THElement? _selectedElement;
  THElement? _originalSelectedElement;
  final THFileDisplayStore thFileDisplayStore = getIt<THFileDisplayStore>();
  late final THFileStore thFileStore = widget.thFileStore;
  late final THFile file = widget.thFileStore.thFile;
  bool _repaintTrigger = false;

  @override
  void initState() {
    super.initState();
    thFileDisplayStore.updateDataBoundingBox(file.boundingBox());
    thFileDisplayStore.setCanvasScaleTranslationUndefined(true);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        thFileDisplayStore.updateScreenSize(
            Size(constraints.maxWidth, constraints.maxHeight));

        if (thFileDisplayStore.canvasScaleTranslationUndefined) {
          thFileDisplayStore.zoomShowAll();
        }
        return GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child: CustomPaint(
            painter: THFilePainter(file),
            size: thFileDisplayStore.screenSize,
          ),
        );
      },
    );
  }

  void _onPanStart(DragStartDetails details) {
    if (thFileDisplayStore.mode != TH2FileEditMode.select) {
      return;
    }

    // final Offset localPositionOnCanvas =
    //     thFileDisplayStore.offsetScreenToCanvas(details.localPosition);
    // final Iterable<THPaintAction> paintActions = _paintActions.values;

    // for (final THPaintAction action in paintActions) {
    //   if (action is THPointPaintAction &&
    //       action.contains(localPositionOnCanvas)) {
    //     setState(() {
    //       _selectedElement = action.element;
    //       _originalSelectedElement = (_selectedElement! as THPoint).clone();
    //     });
    //     break;
    //   }
    // }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    switch (thFileDisplayStore.mode) {
      case TH2FileEditMode.select:
        _onPanUpdateSelectMode(details);
        break;
      case TH2FileEditMode.pan:
        thFileDisplayStore.onPanUpdate(details);
        setState(() {
          _repaintTrigger = !_repaintTrigger;
        });
        break;
    }
  }

  void _onPanUpdateSelectMode(DragUpdateDetails details) {
    if ((_selectedElement == null) ||
        (thFileDisplayStore.mode != TH2FileEditMode.select)) {
      return;
    }

    final Offset localPositionOnCanvas =
        thFileDisplayStore.offsetScreenToCanvas(details.localPosition);

    setState(() {
      (_selectedElement! as THPointInterface).x = localPositionOnCanvas.dx;
      (_selectedElement! as THPointInterface).y = localPositionOnCanvas.dy;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_selectedElement == null) {
      return;
    }
    thFileStore.updatePointPosition(
        _originalSelectedElement! as THPoint, _selectedElement! as THPoint);
    setState(() {
      _selectedElement = null;
      _originalSelectedElement = null;
    });
  }
}
