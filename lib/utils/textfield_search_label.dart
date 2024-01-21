class PlaceItem {
  String label;
  dynamic value;
  PlaceItem({required this.label, required this.value});

  factory PlaceItem.fromJson(Map<String, dynamic> json) {
    return PlaceItem(label: json['label'], value: json['value']);
  }
}
