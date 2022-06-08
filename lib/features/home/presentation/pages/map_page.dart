import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/widgets/app_bar_back_arrow.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late CenterOnLocationUpdate _centerOnLocationUpdate;
  late StreamController<double?> _centerCurrentLocationStreamController;

  final MapController _mapController = MapController();
  double _zoom = 7;
  final List<LatLng> _latLngList = [
    LatLng(55.757726, 37.610848),
    LatLng(55.769822, 37.643661),
    LatLng(55.813063, 37.622852),
    LatLng(55.813020, 37.717735),
    LatLng(55.758575, 37.787700),
    LatLng(55.702137, 37.845778),
    LatLng(55.631006, 37.854605),
    LatLng(55.601805, 37.816130),
    LatLng(55.651207, 37.210469),
    LatLng(55.838221, 37.501479),
  ];
  List<Marker> _markers = [];

  @override
  void initState() {
    _centerOnLocationUpdate = CenterOnLocationUpdate.never;
    _centerCurrentLocationStreamController = StreamController<double?>();
    _markers = _latLngList
        .map((point) => Marker(
              point: point,
              width: 30,
              height: 30,
              builder: (context) => const Icon(
                Icons.pin_drop,
                size: 30,
                color: Colors.blueAccent,
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  void dispose() {
    _centerCurrentLocationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackArrow(),
        centerTitle: true,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          // swPanBoundary: LatLng(13, 77.5),
          // nePanBoundary: LatLng(13.07001, 77.58),
          center: _latLngList[0],
          bounds: LatLngBounds.fromPoints(_latLngList),
          zoom: _zoom,
          onPositionChanged: (MapPosition position, bool hasGesture) {
            if (hasGesture) {
              setState(
                () => _centerOnLocationUpdate = CenterOnLocationUpdate.never,
              );
            }
          },
          // plugins: [
          //   MarkerClusterPlugin(),
          // ],
        ),
        children: [
          TileLayerWidget(
            options: TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
              maxZoom: 19,
            ),
          ),
          LocationMarkerLayerWidget(
            plugin: LocationMarkerPlugin(
              centerCurrentLocationStream:
                  _centerCurrentLocationStreamController.stream,
              centerOnLocationUpdate: _centerOnLocationUpdate,
            ),
          ),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 100,
              disableClusteringAtZoom: 16,
              size: const Size(40, 40),
              fitBoundsOptions: const FitBoundsOptions(
                padding: EdgeInsets.all(40),
              ),
              markers: _markers,
              polygonOptions: const PolygonOptions(
                  borderColor: Colors.blueAccent,
                  color: Colors.black12,
                  borderStrokeWidth: 3),
              // popupOptions: PopupOptions(
              //   popupSnap: PopupSnap.mapTop,
              //   // popupController: _popupController,
              //   popupBuilder: (_, marker) => Container(
              //     color: Colors.amberAccent,
              //     child: Text('Popup'),
              //   ),
              // ),
              builder: (context, markers) {
                return Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                  child: Text('${markers.length}'),
                );
              },
            ),
          ),
        ],
        nonRotatedChildren: [
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () async {
                // Проверка разрешений на доступ к локации и запрос на доступ
                LocationPermission? permission;
                permission = await Geolocator.checkPermission();
                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                  if (permission == LocationPermission.deniedForever) {
                    return Future.error('Location Not Available');
                  }
                } else {
                  // Position currentPosition =
                  // await Geolocator.getCurrentPosition();
                  // print(currentPosition);

                  // Automatically center the location marker on the map when location updated until user interact with the map.
                  setState(
                    () =>
                        _centerOnLocationUpdate = CenterOnLocationUpdate.always,
                  );
                  // Center the location marker on the map and zoom the map to level 18.
                  _centerCurrentLocationStreamController.add(14);
                }
              },
              child: const Icon(
                Icons.my_location,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
