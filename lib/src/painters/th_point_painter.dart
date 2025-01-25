import 'package:flutter/material.dart';
import 'package:mapiah/src/stores/th_file_edit_store.dart';

class THPointPainter extends CustomPainter {
  final Offset position;
  final double pointRadius;
  final Paint pointPaint;
  final THFileEditStore thFileEditStore;

  THPointPainter({
    super.repaint,
    required this.position,
    required this.pointRadius,
    required this.pointPaint,
    required this.thFileEditStore,
  });

  @override
  void paint(Canvas canvas, Size size) {
    thFileEditStore.transformCanvas(canvas);

    canvas.drawCircle(
      position,
      pointRadius,
      pointPaint,
    );
  }

  @override
  bool shouldRepaint(covariant THPointPainter oldDelegate) {
    // return (pointRadius != oldDelegate.pointRadius) ||
    //     (pointPaint != oldDelegate.pointPaint) ||
    //     (position.dx != oldDelegate.position.dx) ||
    //     (position.dy != oldDelegate.position.dy);
    return true;
  }
}
