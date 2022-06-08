import 'package:flutter/cupertino.dart';
import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/http_client/retrofit_http_client.dart';
import 'package:phones_market/core/utils/settings.dart';
import 'package:phones_market/features/home/data/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRemoteDataSource {
  final RetrofitHttpClient client;

  HomeRemoteDataSource({required this.client});

  Future<HomeModel> getHomeData() async {
    try {
      return await client.getHomeData();
    } catch (err) {
      throw ServerException();
    }
  }
}

// class HomeRemoteDataSource {
//   final http.Client client;
//
//   HomeRemoteDataSource({required this.client});
//
//   Future<HomeModel> getHomeData() async {
//     final response = await client
//         .get(Uri.parse("https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"));
//     if (response.statusCode == 200) {
//       return HomeModel.fromJson(json.decode(response.body));
//           // json.decode(response.body).map((x) => HomeModel.fromJson(x));
//     } else {
//       throw ServerException();
//     }
//   }
// }
