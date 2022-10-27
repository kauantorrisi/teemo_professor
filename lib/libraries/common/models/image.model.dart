import 'dart:convert';

class ImageModel {
  ImageModel({
    this.full,
    this.sprite,
    this.group,
    this.x,
    this.y,
    this.w,
    this.h,
  });

  String? full;
  final String? sprite;
  final String? group;
  final int? x;
  final int? y;
  final int? w;
  final int? h;

  factory ImageModel.fromJson(String str) =>
      ImageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
        full: json["full"],
        sprite: json["sprite"],
        group: json["group"],
        x: json["x"],
        y: json["y"],
        w: json["w"],
        h: json["h"],
      );

  Map<String, dynamic> toMap() => {
        "full": full,
        "sprite": sprite,
        "group": group,
        "x": x,
        "y": y,
        "w": w,
        "h": h,
      };
}
