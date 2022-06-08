import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/utils/settings.dart';
import 'package:phones_market/features/detail/data/models/detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/http_client/retrofit_http_client.dart';

class DetailRemoteDataSource {
  final RetrofitHttpClient client;

  DetailRemoteDataSource({required this.client});

  Future<DetailModel> getDetailData() async {
    try {
      return await client.getDetailData();
    } catch (err) {
      throw ServerException();
    }
  }
}

// class DetailRemoteDataSource {
//   final http.Client client;
//
//   DetailRemoteDataSource({required this.client});
//
//   Future<DetailModel> getHomeData() async {
//     final response = await client
//         .get(Uri.parse("https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"));
//     if (response.statusCode == 200) {
//       return DetailModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }
// }
