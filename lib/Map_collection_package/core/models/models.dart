class Light {
  String? location;
  String? name;
  bool? status;
  List<double>? position;
  int? tile;

  Light.fromMap(Map data) {
    location = data['location'] ?? 'No location.';
    name = data['name'] ?? 'No name.';
    status = data['status'] ?? false;
    position = data['position'] ?? [0.0];
    tile = data['tile'] ?? 0;
  }
}
