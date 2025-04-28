import 'package:flutter/material.dart';
import 'package:geojson_vi/geojson_vi.dart';

class IndoorMapPainter extends CustomPainter {
  final GeoJSONFeatureCollection featureCollection;
  late final double mapWidth;
  late final double mapHeight;

  IndoorMapPainter(this.featureCollection) {
    _calculateMapSize();
  }

  void _calculateMapSize() {
    double maxX = 0;
    double maxY = 0;

    for (GeoJSONFeature? feature in featureCollection.features) {
      if (feature?.geometry is GeoJSONPolygon) {
        final polygon = feature?.geometry as GeoJSONPolygon;
        for (var ring in polygon.coordinates) {
          for (var point in ring) {
            if (point[0] > maxX) maxX = point[0];
            if (point[1] > maxY) maxY = point[1];
          }
        }
      }
    }

    mapWidth = maxX;
    mapHeight = maxY;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / mapWidth;
    final scaleY = size.height / mapHeight;
    //final paint = Paint()..style = PaintingStyle.fill; // Removed default color from here
    final borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (var feature in featureCollection.features) {
      if (feature?.geometry is GeoJSONPolygon) {
        final polygon = feature?.geometry as GeoJSONPolygon;

        final path = Path();
        for (var ring in polygon.coordinates) {
          if (ring.isEmpty) continue;

          path.moveTo(
            ring[0][0] * scaleX,
            ring[0][1] * scaleY,
          );

          for (var point in ring.skip(1)) {
            path.lineTo(
              point[0] * scaleX,
              point[1] * scaleY,
            );
          }
          path.close();
        }
        // Set color based on properties, default color is applied.
        final paint = _getPaint(feature?.properties);

        canvas.drawPath(path, paint);
        canvas.drawPath(path, borderPaint);

        // Draw labels
        _drawTextLabel(
          canvas,
          path,
          polygon,
          feature?.properties,
          size,
          scaleX,
          scaleY,
        );
      }
    }
  }

  //helper function to get paint color.
  Paint _getPaint(Map<String, dynamic>? properties) {
    final paint = Paint()..style = PaintingStyle.fill;
    if (properties == null) {
      paint.color = Colors.blueAccent.withOpacity(0.5); // Default
    } else if (properties['type'] == 'desk') {
      if (properties['occupied'] == true) {
        paint.color = Colors.redAccent;
      } else {
        paint.color = Colors.greenAccent;
      }
    } else if (properties['type'] == 'room') {
      paint.color = Colors.lightBlue.shade100;
    } else if (properties['type'] == 'aisle') {
      paint.color = Colors.grey.shade300;
    } else if (properties['type'] == 'boundary') {
      paint.color = Colors.green.shade100;
      paint.style = PaintingStyle.stroke;
    } else {
      paint.color = Colors.blueAccent.withOpacity(0.5); // Default
    }
    return paint;
  }

  void _drawTextLabel(
      Canvas canvas,
      Path path,
      GeoJSONPolygon polygon,
      Map<String, dynamic>? properties,
      Size size,
      double scaleX,
      double scaleY) {
    // Added polygon
    if (properties == null || properties['name'] == null) return;

    final String name = properties['name'];
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: name,
        style: const TextStyle(
          color: Colors.black, // Label color
          fontSize: 12, // Label font size
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Calculate the centroid of the polygon
    Offset? centroid =
        _calculatePolygonCentroid(polygon, scaleX, scaleY); // Use the polygon
    if (centroid == null) return;

    textPainter.paint(canvas, centroid);
  }

  Offset? _calculatePolygonCentroid(
      GeoJSONPolygon polygon, double scaleX, double scaleY) {
    // Changed to use GeoJSONPolygon
    double xSum = 0;
    double ySum = 0;
    int count = 0;

    for (final ring in polygon.coordinates) {
      for (final point in ring) {
        final x = point[0] * scaleX; // Apply scale here
        final y = point[1] * scaleY;
        xSum += x;
        ySum += y;
        count++;
      }
    }
    if (count == 0) return null;
    return Offset(xSum / count, ySum / count);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
