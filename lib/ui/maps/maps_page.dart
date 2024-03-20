// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/core/components/components.dart';
import 'package:weatherforecasts/data/sources/remote/services/geoapify_service.dart';
import 'package:weatherforecasts/data/sources/remote/services/services.dart';

import '../../domain/models/models.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> with TickerProviderStateMixin {
  late final MapController _mapController;
  LatLng? _selectedLatLng;
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final CurrentLocationLayer _currentLocationLayer;
  @override
  void initState() {
    super.initState();

    _currentLocationLayer = CurrentLocationLayer(alignPositionOnUpdate: AlignOnUpdate.never);
    _animationController = AnimationController(
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 150),
    );
    _animation = Tween(begin: 0.0, end: 48.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _mapController = MapController();
    _mapController.mapEventStream.listen((event) async {
      if (event is MapEventLongPress) {
        if (_selectedLatLng != null) await _animationController.reverse(from: 1).then((value) => null);
        _selectedLatLng = event.tapPosition;
        _animationController.forward(from: 0);
      }
    });
    _selectedLatLng = Get.arguments as LatLng;
    _debouncedSearch = _debounce<Iterable<Suggestion>, String>((s) {
      return _search(context, s);
    });
  }

  final _searchController = SearchController();
  late final _Debounceable<Iterable<Suggestion>?, String> _debouncedSearch;

  Future<Iterable<Suggestion>?> _search(BuildContext context, String query) async {
    if (query.isEmpty) return null;
    try {
      final suggestions = await GeoapifyService.getGeoapifyData(query);
      return suggestions;
    } catch (e) {
      if (!context.mounted) return null;
      ToastUtils.showToastError(context, e.toString());
      return null;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      extendBodyBehindAppBar: true,
      isSingleChildScrollView: false,
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: Get.arguments as LatLng,
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                retinaMode: true,
              ),
              if (_selectedLatLng != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: _animation.value,
                      height: _animation.value,
                      point: _selectedLatLng!,
                      child: GestureDetector(
                        onTap: () {
                          _animationController.reverse(from: 1).then((value) => _selectedLatLng = null);
                        },
                        child: Container(
                          width: _animation.value,
                          height: _animation.value,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.locationDot,
                              color: Colors.red,
                              size: _animation.value * 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              _currentLocationLayer,
            ],
          ),
          Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: SearchAnchor.bar(
                // builder: (context, controller) {
                //   return SearchBar(
                //     controller: controller,
                //   );
                // },
                searchController: _searchController,
                suggestionsBuilder: (context, controller) async {
                  final results = await _debouncedSearch(controller.text);
                  if (results == null) return [];

                  final query = controller.text;
                  if (query.isEmpty) return [];
                  return results.map((e) {
                    return ListTile(
                      title: Text(
                        e.address,
                        style: AppTextStyle.body1SemiBold(context),
                      ),
                      onTap: () {
                        controller.closeView(controller.text);
                        _mapController.move(e.latLng, 13.0);
                        _selectedLatLng = e.latLng;
                        _animationController.forward(from: 0);
                      },
                    );
                  }).toList();
                },
              )),
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              children: [
                _selectedLatLng != null
                    ? Column(
                        children: [
                          Opacity(
                            opacity: _animation.value / 48,
                            child: FloatingActionButton.small(
                              heroTag: 'selectLocation',
                              backgroundColor: kLight100,
                              child: const FaIcon(
                                FontAwesomeIcons.check,
                                color: kDark500,
                              ),
                              onPressed: () {
                                Get.back(result: _selectedLatLng);
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      )
                    : const SizedBox(),
                FloatingActionButton.small(
                  heroTag: 'currentLocation',
                  backgroundColor: kLight100,
                  child: const FaIcon(
                    FontAwesomeIcons.crosshairs,
                    color: kDark500,
                  ),
                  onPressed: () async {
                    try {
                      final position = await GeolocatorService.getCurrentLocation();
                      // _mapController.move(LatLng(position.latitude, position.longitude), 13.0);
                      _animatedMapMove(LatLng(position.latitude, position.longitude), 13.0);
                    } catch (e) {
                      if (!context.mounted) return;
                      ToastUtils.showToastError(context, e.toString());
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final camera = _mapController.camera;
    final latTween = Tween<double>(begin: camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(begin: camera.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: camera.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // Note this method of encoding the target destination is a workaround.
    // When proper animated movement is supported (see #1263) we should be able
    // to detect an appropriate animated movement event which contains the
    // target zoom/center.

    final startIdWithTarget = '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }

      hasTriggeredMove = _mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}

typedef _Debounceable<S, T> = Future<S?> Function(T parameter);

_Debounceable<S, T> _debounce<S, T>(_Debounceable<S?, T> function) {
  _DebounceTimer? debounceTimer;

  return (T parameter) async {
    if (debounceTimer != null && !debounceTimer!.isCompleted) {
      debounceTimer!.cancel();
    }
    debounceTimer = _DebounceTimer();
    try {
      await debounceTimer!.future;
    } catch (error) {
      print(error); // Should be 'Debounce cancelled' when cancelled.
      return null;
    }
    return function(parameter);
  };
}

class _DebounceTimer {
  _DebounceTimer() {
    _timer = Timer(_duration, _onComplete);
  }

  late final Timer _timer;
  final Duration _duration = const Duration(milliseconds: 500);
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError('Debounce cancelled');
  }
}
