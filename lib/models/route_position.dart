import 'dart:convert';

List<RoutePositionModel> routePositionModelFromJson(String str) {
  var response = json.decode(str)['data'];
  return response
      .map<RoutePositionModel>((e) => RoutePositionModel.fromJson(e))
      .toList();
}

String routePositionModelToJson(RoutePositionModel data) =>
    json.encode(data.toJson());

class RoutePositionModel {
  int? id;
  int? x;
  int? y;
  int? screenWidth;
  int? screenHeight;
  dynamic lineId;

  RoutePositionModel(
      {this.id,
      this.x,
      this.y,
      this.screenWidth,
      this.screenHeight,
      this.lineId});

  factory RoutePositionModel.fromJson(Map<String, dynamic> json) =>
      RoutePositionModel(
        id: json['id'],
        x: json['x_point'],
        y: json['y_point'],
        screenWidth: json['screen_width'],
        screenHeight: json['screen_height'],
        lineId: json['line_id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "x_point": x,
        "y_point": y,
        "line_id": lineId,
        "screen_width": screenWidth,
        "screen_height": screenHeight
      };
}
