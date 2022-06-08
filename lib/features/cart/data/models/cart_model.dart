import 'package:phones_market/features/cart/domain/entities/cart_entity.dart';
import 'dart:convert';

// List<CartModel> cartModelFromJson(String str) =>
//     List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));
//
// String cartModelToJson(List<CartModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel extends CartEntity {
  CartModel({
    required id,
    required delivery,
    required total,
    required basket,
  }) : super(
          id: id,
          delivery: delivery,
          total: total,
          basket: basket,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        delivery: json["delivery"],
        total: json["total"],
        basket: List<BasketEntity>.from(json["basket"].map((x) => BasketEntity(
              id: x["id"],
              images: x["images"],
              price: x["price"],
              title: x["title"],
            ))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "delivery": delivery,
        "total": total,
        "basket": List<dynamic>.from(basket.map((x) => {
              "id": x.id,
              "images": x.images,
              "price": x.price,
              "title": x.title,
            })),
      };
}
