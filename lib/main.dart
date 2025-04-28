import 'package:flutter/material.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:indoor_maps/floorplan.dart';
import 'indoor_map_painter.dart';

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
