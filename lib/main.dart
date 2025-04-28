import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'dart:convert';

import 'package:indoor_maps/floorplan.dart';

void main() {
  runApp(const IndoorMapScreen());
}

class IndoorMapScreen extends StatefulWidget {
  const IndoorMapScreen({super.key});

  @override
  State<IndoorMapScreen> createState() => _IndoorMapScreenState();
}

class _IndoorMapScreenState extends State<IndoorMapScreen> {
  GeoJSONFeatureCollection? _featureCollection;

  @override
  void initState() {
    super.initState();
    _loadGeoJson();
  }

  Future<void> _loadGeoJson() async {
    // final rawData = await rootBundle.loadString('floorplan.dart');
    // final data = json.decode(rawData);

    try {
      final collection = GeoJSONFeatureCollection.fromMap(geoJsonMap);
      setState(() {
        _featureCollection = collection;
      });
    } catch (e) {
      print('Unable to load GeoJSON map');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Floor plan')),
        body: _featureCollection == null
            ? const Center(child: CircularProgressIndicator())
            : InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 4.0,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: IndoorMapPainter(_featureCollection!),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

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
    final paint = Paint()
      ..color = Colors.blueAccent.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

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

        canvas.drawPath(path, paint);
        canvas.drawPath(path, borderPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
