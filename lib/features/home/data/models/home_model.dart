import 'package:phones_market/features/home/domain/entities/home_entity.dart';

import 'dart:convert';

// List<HomeModel> homeModelFromJson(String str) =>
//     List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));
//
// String homeModelToJson(List<HomeModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel extends HomeEntity {
  HomeModel({
    // required id,
    required homeStore,
    required bestSeller,
  }) : super(
          // id: id,
          homeStore: homeStore,
          bestSeller: bestSeller,
        );

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        // id: json["_id"],
        homeStore: List<HomeStore>.from(json["home_store"].map((x) => HomeStore(
              id: x["id"],
              isNew: x["is_new"] == null ? false : x["is_new"],
              title: x["title"],
              subtitle: x["subtitle"],
              picture: x["picture"],
              isBuy: x["is_buy"],
            ))),
        bestSeller:
            List<BestSeller>.from(json["best_seller"].map((x) => BestSeller(
                  id: x["id"],
                  isFavorites: x["is_favorites"],
                  title: x["title"],
                  priceWithoutDiscount: x["price_without_discount"],
                  discountPrice: x["discount_price"],
                  picture: x["picture"],
                ))),
      );

  Map<String, dynamic> toJson() => {
        // "_id": id,
        "home_store": List<dynamic>.from(homeStore.map((x) => {
              "id": x.id,
              "is_new": x.isNew == null ? null : x.isNew,
              "title": x.title,
              "subtitle": x.subtitle,
              "picture": x.picture,
              "is_buy": x.isBuy,
            })),
        "best_seller": List<dynamic>.from(bestSeller.map((x) => {
              "id": x.id,
              "is_favorites": x.isFavorites,
              "title": x.title,
              "price_without_discount": x.priceWithoutDiscount,
              "discount_price": x.discountPrice,
              "picture": x.picture,
            })),
      };
}
