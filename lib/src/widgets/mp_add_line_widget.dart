import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mapiah/src/controllers/th2_file_edit_controller.dart';
import 'package:mapiah/src/controllers/types/th_line_paint.dart';
import 'package:mapiah/src/controllers/types/th_point_paint.dart';
import 'package:mapiah/src/definitions/mp_definitions.dart';
import 'package:mapiah/src/elements/th_element.dart';
import 'package:mapiah/src/painters/th_control_point_painter.dart';
import 'package:mapiah/src/painters/th_elements_painter.dart';
import 'package:mapiah/src/painters/th_line_painter.dart';
import 'package:mapiah/src/painters/th_line_painter_line_segment.dart';
import 'package:mapiah/src/painters/th_end_point_painter.dart';
import 'package:mapiah/src/widgets/mixins/mp_get_line_segments_map_mixin.dart';

class MPAddLineWidget extends StatelessWidget with MPGetLineSegmentsMapMixin {
  final TH2FileEditController th2FileEditController;

  MPAddLineWidget({
    required this.th2FileEditController,
    required super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        th2FileEditController.redrawTriggerNewLine;

        final THLine newLine = th2FileEditController.getNewLine();

        final (
          LinkedHashMap<int, THLinePainterLineSegment> segmentsMap,
          LinkedHashMap<int, Offset> endPointsMap,
        ) = getLineSegmentsAndEndpointsMaps(
          line: newLine,
          thFile: th2FileEditController.thFile,
          returnEndpoints: true,
        );

        final THPointPaint pointPaintInfo =
            th2FileEditController.getNewLinePointPaint();
        final double pointRadius = pointPaintInfo.radius;
        final double pointWidth = pointRadius * 2;
        final double expandedPointWidth =
            pointWidth * thWhiteBackgroundIncrease;
        final Paint pointPaint = pointPaintInfo.paint;

        final THLinePaint linePaintInfo =
            th2FileEditController.getNewLinePaint();
        final Paint linePaint = linePaintInfo.paint;

        CustomPainter painter = THLinePainter(
          lineSegmentsMap: segmentsMap,
          linePaint: linePaint,
          th2FileEditController: th2FileEditController,
          canvasScale: th2FileEditController.canvasScale,
          canvasTranslation: th2FileEditController.canvasTranslation,
        );

        final List<CustomPainter> painters = [painter];

        for (final Offset endPoint in endPointsMap.values) {
          painter = THEndPointPainter(
            position: endPoint,
            pointPaint: pointPaint,
            width: pointWidth,
            expandedWidth: expandedPointWidth,
            th2FileEditController: th2FileEditController,
            canvasScale: th2FileEditController.canvasScale,
            canvasTranslation: th2FileEditController.canvasTranslation,
          );
          painters.add(painter);
        }

        final THLineSegment lastSegment = th2FileEditController.thFile
            .elementByMapiahID(newLine.childrenMapiahID.last) as THLineSegment;

        if (lastSegment is THBezierCurveLineSegment) {
          final double expandedPointRadius =
              pointRadius * thWhiteBackgroundIncrease;
          final THControlPointPainter controlPoint1Painter =
              THControlPointPainter(
            position: lastSegment.controlPoint1.coordinates,
            pointPaint: pointPaint,
            pointRadius: pointRadius,
            expandedPointRadius: expandedPointRadius,
            th2FileEditController: th2FileEditController,
            canvasScale: th2FileEditController.canvasScale,
            canvasTranslation: th2FileEditController.canvasTranslation,
          );
          painters.add(controlPoint1Painter);

          final THControlPointPainter controlPoint2Painter =
              THControlPointPainter(
            position: lastSegment.controlPoint2.coordinates,
            pointPaint: pointPaint,
            pointRadius: pointRadius,
            expandedPointRadius: expandedPointRadius,
            th2FileEditController: th2FileEditController,
            canvasScale: th2FileEditController.canvasScale,
            canvasTranslation: th2FileEditController.canvasTranslation,
          );
          painters.add(controlPoint2Painter);
        }

        return RepaintBoundary(
          child: CustomPaint(
            painter: THElementsPainter(
              painters: painters,
              th2FileEditController: th2FileEditController,
              canvasScale: th2FileEditController.canvasScale,
              canvasTranslation: th2FileEditController.canvasTranslation,
            ),
            size: th2FileEditController.screenSize,
          ),
        );
      },
    );
  }
}
