import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show GoogleMap, CameraPosition, LatLng, GoogleMapController;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong;

class ResponsiveMap extends StatefulWidget {
  const ResponsiveMap({super.key});

  @override
  State<ResponsiveMap> createState() => _ResponsiveMapState();
}

class _ResponsiveMapState extends State<ResponsiveMap> {
  final LatLng cartagenaLatLng = const LatLng(10.3910, -75.4794);
  GoogleMapController? _mapController;

  // 🎨 Estilo oscuro para Google Maps (solo móviles)
  final String darkMapStyle = '''
  [
    {"elementType": "geometry", "stylers": [{"color": "#212121"}]},
    {"elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
    {"elementType": "labels.text.stroke", "stylers": [{"color": "#212121"}]},
    {"featureType": "road", "elementType": "geometry", "stylers": [{"color": "#383838"}]},
    {"featureType": "road", "elementType": "labels.text.fill", "stylers": [{"color": "#8a8a8a"}]},
    {"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#000000"}]},
    {"featureType": "water", "elementType": "labels.text.fill", "stylers": [{"color": "#3d3d3d"}]}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    if (kIsWeb) {
      // 🌐 Flutter Web usa flutter_map con tiles oscuros/claro
      final darkUrl =
          'https://basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png';
      final lightUrl =
          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

      // Forzar reconstrucción al cambiar el tema
      return FlutterMap(
        key: ValueKey(isDark), // 🔑 fuerza actualización visual
        options: MapOptions(
          center: latlong.LatLng(
            cartagenaLatLng.latitude,
            cartagenaLatLng.longitude,
          ),
          zoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: isDark ? darkUrl : lightUrl,
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.ecotruck',
          ),
        ],
      );
    } else {
      // 📱 Android/iOS usa Google Maps
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: cartagenaLatLng,
          zoom: 13,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (controller) {
          _mapController = controller;
          if (isDark) {
            _mapController?.setMapStyle(darkMapStyle);
          } else {
            _mapController?.setMapStyle(null);
          }
        },
      );
    }
  }
}
