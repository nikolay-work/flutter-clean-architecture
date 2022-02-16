import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/utils/settings.dart';
import 'package:phones_market/features/home/data/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSource({required this.client});

  Future<List<HomeModel>> getHomeData() async {
    final response = await client
        .get(Uri.parse("https://shopapi-0575.restdb.io/rest/home"), headers: {
      'Content-type': 'application/json',
      'x-apikey': Settings.apikey,
    });
    if (response.statusCode == 200) {
      return List<HomeModel>.from(
          json.decode(response.body).map((x) => HomeModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }
}
