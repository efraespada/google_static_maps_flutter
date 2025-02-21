part of google_static_maps_controller;

abstract class Marker implements MapPart {
  final List<Location> locations;

  const Marker._(this.locations);

  /// Create default google maps style marker
  const factory Marker({
    required List<Location> locations,
    Color? color,
    MarkerSize? size,
    String? label,
  }) = DefaultMarker;

  /// Create marker with custom icon
  const factory Marker.custom({
    required List<Location> locations,
    required String icon,
    MarkerAnchor? anchor,
  }) = CustomMarker;

  String get _markerLocationsString {
    List<String> parts = List<String>.generate(
      locations.length,
      (int index) => locations[index].toUrlString(),
    );
    return parts.join(_separator);
  }
}
