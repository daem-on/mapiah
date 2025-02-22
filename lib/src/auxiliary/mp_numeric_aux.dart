import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mapiah/src/definitions/mp_definitions.dart';
import 'package:mapiah/src/elements/parts/th_double_part.dart';
import 'package:mapiah/src/elements/parts/types/th_length_unit_type.dart';
import 'package:mapiah/src/exceptions/th_convert_from_string_exception.dart';
import 'package:dart_numerics/dart_numerics.dart' as numerics;

class MPNumericAux {
  static RegExp endingZeroes = RegExp(r'0*$');
  static RegExp endingDot = RegExp(r'\.$');

  static THDoublePart fromString(String valueString) {
    valueString = valueString.trim();

    final double? doubleValue = double.tryParse(valueString);
    if (doubleValue == null) {
      throw THConvertFromStringException(
          'THDoublePart fromString', valueString);
    }
    final double value = doubleValue;

    final int dotPosition = valueString.indexOf(thDecimalSeparator);
    final int decimalPositions =
        (dotPosition > 0) ? valueString.length - (dotPosition + 1) : 0;

    return THDoublePart(value: value, decimalPositions: decimalPositions);
  }

  static String doubleToString(double value, int decimalPositions) {
    /// Adapted from https://stackoverflow.com/a/67497099/11754455
    final double incrementValue = numerics.positiveEpsilonOf(value);

    if (value < 0) {
      value -= incrementValue;
    } else {
      value += incrementValue;
    }

    final String valueString = value.toStringAsFixed(decimalPositions);

    return removeTrailingZeros(valueString);
  }

  static String removeTrailingZeros(String valueString) {
    if (valueString.contains('.')) {
      // Remove trailing zeros
      valueString = valueString.replaceAll(endingZeroes, '');
      // Remove the decimal point if it is the last character
      valueString = valueString.replaceAll(endingDot, '');
    }
    return valueString;
  }

  static bool isRect1InsideRect2({
    required Rect rect1,
    required Rect rect2,
  }) {
    return rect2.contains(rect1.topLeft) && rect2.contains(rect1.bottomRight);
  }

  /// In Flutter, the Rect.fromLTRB() method does not check if the left is
  /// greater than the right or if the top is greater than the bottom so I am
  /// providing this method to ensure that the Rect is ordered.
  ///
  /// The problem is that for Flutter:
  ///  bool get isEmpty => left >= right || top >= bottom;
  /// for a Rect.
  ///
  /// If you are not paying attention, let me repeat it: for Flutter if the TOP
  /// of a Rect is GREATER than the BOTTOM, the Rect is EMPTY!!
  ///
  /// All created Rects in Mapiah should be ordered according to Flutter
  /// expectations.
  ///
  /// /// For more details, see the Flutter documentation:
  /// [Flutter Rect Documentation](https://main-api.flutter.dev/flutter/dart-ui/Rect/isEmpty.html)
  static Rect orderedRectFromLTRB({
    required double left,
    required double top,
    required double right,
    required double bottom,
  }) {
    double rectLeft = left;
    double rectTop = top;
    double rectRight = right;
    double rectBottom = bottom;

    if (rectLeft > rectRight) {
      rectLeft = right;
      rectRight = left;
    } else if (rectLeft == rectRight) {
      rectLeft = nextDown(rectLeft);
      rectRight = nextUp(rectRight);
    }

    if (rectTop > rectBottom) {
      rectTop = bottom;
      rectBottom = top;
    } else if (rectTop == rectBottom) {
      rectTop = nextDown(rectTop);
      rectBottom = nextUp(rectBottom);
    }

    return Rect.fromLTRB(rectLeft, rectTop, rectRight, rectBottom);
  }

  /// In Flutter, the Rect.fromLTWH() method does not check if the width is
  /// negative or if the height is negative so I am providing this method to
  /// ensure that the Rect is ordered according to Flutter expectations.
  static Rect orderedRectFromLTWH({
    required double left,
    required double top,
    required double width,
    required double height,
  }) {
    return orderedRectFromLTRB(
      left: left,
      top: top,
      right: left + width,
      bottom: top + height,
    );
  }

  static Rect orderedRectSmallestAroundPoint({
    required Offset center,
  }) {
    return orderedRectFromLTRB(
      left: nextDown(center.dx),
      top: nextDown(center.dy),
      right: nextUp(center.dx),
      bottom: nextUp(center.dy),
    );
  }

  /// In Flutter, the Rect.fromCenter() method does not check if the width or
  /// the height is negative so I am providing this method to ensure that the
  /// Rect is ordered according to Flutter expectations.
  static Rect orderedRectFromCenter({
    required Offset center,
    required double width,
    required double height,
  }) {
    final double left = center.dx - width / 2;
    final double top = center.dy - height / 2;
    final double right = center.dx + width / 2;
    final double bottom = center.dy + height / 2;

    return orderedRectFromLTRB(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  /// In Flutter, the Rect.fromCircle() method does not check if the radius is
  /// negative so I am providing this method to ensure that the Rect is ordered
  /// according to Flutter expectations.
  static Rect orderedRectFromCircle({
    required Offset center,
    required double radius,
  }) {
    final double left = center.dx - radius;
    final double top = center.dy - radius;
    final double right = center.dx + radius;
    final double bottom = center.dy + radius;

    return orderedRectFromLTRB(
        left: left, top: top, right: right, bottom: bottom);
  }

  /// In Flutter, the Rect.fromPoints() method is the only method that actually
  /// checks if the points are ordered correctly but I am providing this method
  /// anyway for consistency: always create Rect through MPNUmeric methods.
  static Rect orderedRectFromPoints({
    required Offset point1,
    required Offset point2,
  }) {
    return orderedRectFromLTRB(
      left: point1.dx,
      top: point1.dy,
      right: point2.dx,
      bottom: point2.dy,
    );
  }

  static Rect orderedRectExpanded({
    required Rect rect,
    required double delta,
  }) {
    return MPNumericAux.orderedRectFromLTRB(
      left: rect.left - delta,
      top: rect.top - delta,
      right: rect.right + delta,
      bottom: rect.bottom + delta,
    );
  }

  static double log10(double x) {
    return math.log(x) / thLogN10;
  }

  static double roundScale(double scale) {
    final double scaleMagnitude = (log10(scale) - 1).floorToDouble();
    final double scaleQuanta = math.pow(10, scaleMagnitude) as double;
    final double rounded = floorToFives(scale / scaleQuanta) * scaleQuanta;

    return rounded;
  }

  static String roundScaleAsTextPercentage(double scale) {
    final double scaleMagnitude = log10(scale);
    final double scaleMagnitudeInt = scaleMagnitude.floorToDouble();
    final double roundTo = math.pow(10, scaleMagnitudeInt - 2) as double;
    final double scaleInt = roundToFives(scale / roundTo) * roundTo * 100;
    final int fractionalDigits =
        (scaleMagnitude >= 0) ? 0 : scaleMagnitude.abs().floor();
    return "${scaleInt.toStringAsFixed(fractionalDigits)}%";
  }

  static double roundNumber(double value) {
    final double valueMagnitude = (log10(value) - 1).floorToDouble();
    final double valueQuanta = math.pow(10, valueMagnitude) as double;
    final double rounded = roundToFives(value / valueQuanta) * valueQuanta;

    return rounded;
  }

  static String roundNumberForScreen(double value) {
    final double rounded = roundNumber(value);
    final double valueMagnitude = (log10(value) - 1).floorToDouble();
    final int fractionalDigits =
        (valueMagnitude >= 0) ? 0 : valueMagnitude.abs().floor();
    String asString = rounded.toStringAsFixed(fractionalDigits);
    if (fractionalDigits > 0) {
      while (asString.endsWith('0')) {
        asString = asString.substring(0, asString.length - 1);
      }
      if (asString.endsWith('.')) {
        asString = asString.substring(0, asString.length - 1);
      }
    }

    return asString;
  }

  static double calculateQuanta(double initialMagnitude) {
    final double magnitudeFactorMin = initialMagnitude.floorToDouble();
    final double magnitudeFactorMax = initialMagnitude.ceilToDouble();
    final double magnitudeFactor =
        ((initialMagnitude - magnitudeFactorMin).abs() > 0.5)
            ? magnitudeFactorMax
            : magnitudeFactorMin;
    final double finalQuanta = math.pow(10, magnitudeFactor) as double;

    return finalQuanta;
  }

  static double roundToFives(double value) {
    return (value / 5).round() * 5;
  }

  static double floorToFives(double value) {
    return (value / 5).floor() * 5;
  }

  static double calculateRoundToQuanta({
    required double scale,
    required double factor,
    required bool isIncrease,
  }) {
    double desiredChange = scale * (factor - 1);
    if (!isIncrease) {
      desiredChange /= factor;
    }

    final double magnitudeFactorRef = log10(desiredChange) - 1;
    final double quanta = calculateQuanta(magnitudeFactorRef);
    final double rounded = roundToFives(desiredChange / quanta) * quanta;

    return rounded > 0 ? rounded : 1;
  }

  static double roundChangedScale({
    required double scale,
    required double factor,
    required bool isIncrease,
  }) {
    final double roundToQuanta = calculateRoundToQuanta(
      scale: scale,
      factor: factor,
      isIncrease: isIncrease,
    );

    final int roundFactor = (scale / roundToQuanta).round();

    return roundFactor * roundToQuanta;
  }

  static double calculateNextZoomLevel({
    required double scale,
    required double factor,
    required bool isIncrease,
  }) {
    final double unroundedScale = isIncrease ? scale * factor : scale / factor;
    final double roundedScale = roundChangedScale(
      scale: unroundedScale,
      factor: factor,
      isIncrease: isIncrease,
    );

    return roundedScale;
  }

  static double lengthConversion({
    required double original,
    required THLengthUnitType originalUnit,
    required THLengthUnitType targetUnit,
  }) {
    if (originalUnit == targetUnit) {
      return original;
    }

    return original * lengthConversionFactors[originalUnit]![targetUnit]!;
  }

  static double distanceSquaredToLineSegment({
    required Offset point,
    required Offset startPoint,
    required Offset endPoint,
  }) {
    final Offset lineVector = endPoint - startPoint;
    final Offset pointVector = point - startPoint;

    final double dotProduct =
        lineVector.dx * pointVector.dx + lineVector.dy * pointVector.dy;
    final double lineLengthSquared =
        lineVector.dx * lineVector.dx + lineVector.dy * lineVector.dy;

    final double t = (lineLengthSquared == 0)
        ? 0
        : (dotProduct / lineLengthSquared).clamp(0, 1);

    final Offset closestPoint = startPoint + lineVector * t;

    return (point - closestPoint).distanceSquared;
  }

  static bool isPointNearLineSegment({
    required Offset point,
    required Offset segmentStart,
    required Offset segmentEnd,
    required double toleranceSquared,
  }) {
    return distanceSquaredToLineSegment(
          point: point,
          startPoint: segmentStart,
          endPoint: segmentEnd,
        ) <=
        toleranceSquared;
  }

  static bool isPointNearBezierCurve({
    required Offset point,
    required List<Offset> controlPoints,
    required double toleranceSquared,
    int numOfSegmentsToCreate = 10,
  }) {
    List<Offset> pointsOnCurve = [];

    for (int i = 0; i <= numOfSegmentsToCreate; i++) {
      pointsOnCurve.add(deCasteljau(controlPoints, i / numOfSegmentsToCreate));
    }

    for (int i = 0; i < pointsOnCurve.length - 1; i++) {
      if (isPointNearLineSegment(
        point: point,
        segmentStart: pointsOnCurve[i],
        segmentEnd: pointsOnCurve[i + 1],
        toleranceSquared: toleranceSquared,
      )) {
        return true;
      }
    }
    return false;
  }

  static double pointsDistance(Offset point1, Offset point2) {
    final double dx = point2.dx - point1.dx;
    final double dy = point2.dy - point1.dy;

    return math.sqrt(dx * dx + dy * dy);
  }

  static Offset lerp(Offset a, Offset b, double t) {
    return a + (b - a) * t;
  }

  static Offset deCasteljau(List<Offset> points, double t) {
    if (points.length == 1) {
      return points[0];
    }

    final List<Offset> innerLevelPoints = [];

    for (int i = 0; i < points.length - 1; i++) {
      innerLevelPoints.add(lerp(points[i], points[i + 1], t));
    }

    return deCasteljau(innerLevelPoints, t);
  }

  static double estimateBezierLength(List<Offset> controlPoints) {
    double length = 0;

    for (int i = 0; i < controlPoints.length - 1; i++) {
      length += (controlPoints[i + 1] - controlPoints[i]).distance;
    }

    return length;
  }

  static int calculateSegments(
    double estimatedLength,
    double desiredSegmentLength,
  ) {
    return (estimatedLength / desiredSegmentLength).ceil();
  }

  static double nextUp(double x) {
    if ((x.isNaN) || (x == double.infinity)) {
      return x;
    }

    if (x == double.negativeInfinity) {
      return -double.maxFinite;
    }

    if ((x == 0.0) || (x == -0.0)) {
      return double.minPositive;
    }

    int signed64 = doubleToInt64Bits(x);

    if (x > 0.0) {
      signed64++;
    } else {
      signed64--;
    }

    return int64BitsToDouble(signed64);
  }

  static double nextDown(double x) {
    if ((x.isNaN) || (x == double.negativeInfinity)) {
      return x;
    }

    if (x == double.infinity) {
      return double.maxFinite;
    }

    if ((x == 0.0) || (x == -0.0)) {
      return -double.minPositive;
    }

    int signed64 = doubleToInt64Bits(x);

    if (x > 0.0) {
      signed64--;
    } else {
      signed64++;
    }

    return int64BitsToDouble(signed64);
  }

  static int doubleToInt64Bits(double value) {
    ByteData bytes = ByteData(8);
    bytes.setFloat64(0, value);
    return bytes.getInt64(0);
  }

  static double int64BitsToDouble(int value) {
    ByteData bytes = ByteData(8);
    bytes.setInt64(0, value);
    return bytes.getFloat64(0);
  }
}
