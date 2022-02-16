import 'package:phones_market/features/detail/domain/entities/detail_entity.dart';
import 'dart:convert';

List<DetailModel> detailModelFromJson(String str) => List<DetailModel>.from(json.decode(str).map((x) => DetailModel.fromJson(x)));

String detailModelToJson(List<DetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailModel extends DetailEntity {
  DetailModel({
    required id,
    required cpu,
    required camera,
    required isFavorites,
    required price,
    required rating,
    required sd,
    required ssd,
    required title,
    required images,
    required color,
    required capacity,
  }) : super (
    id: id,
    cpu: cpu,
    camera: camera,
    isFavorites: isFavorites,
    price: price,
    rating: rating,
    sd: sd,
    ssd: ssd,
    title: title,
    images: images,
    color: color,
    capacity: capacity,
  );

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    id: json["_id"],
    cpu: json["CPU"],
    camera: json["camera"],
    isFavorites: json["isFavorites"],
    price: json["price"],
    rating: json["rating"],
    sd: json["sd"],
    ssd: json["ssd"],
    title: json["title"],
    images: List<String>.from(json["images"].map((x) => x)),
    color: List<String>.from(json["color"].map((x) => x)),
    capacity: List<String>.from(json["capacity"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "CPU": cpu,
    "camera": camera,
    "isFavorites": isFavorites,
    "price": price,
    "rating": rating,
    "sd": sd,
    "ssd": ssd,
    "title": title,
    "images": List<dynamic>.from(images.map((x) => x)),
    "color": List<dynamic>.from(color.map((x) => x)),
    "capacity": List<dynamic>.from(capacity.map((x) => x)),
  };
}
