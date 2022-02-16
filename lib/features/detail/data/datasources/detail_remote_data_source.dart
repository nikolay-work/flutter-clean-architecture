import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/utils/settings.dart';
import 'package:phones_market/features/detail/data/models/detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailRemoteDataSource {
  final http.Client client;

  DetailRemoteDataSource({required this.client});

  Future<List<DetailModel>> getHomeData() async {
    final response = await client
        .get(Uri.parse("https://shopapi-0575.restdb.io/rest/detail"), headers: {
      'Content-type': 'application/json',
      'x-apikey': Settings.apikey,
    });
    if (response.statusCode == 200) {
      return List<DetailModel>.from(
          json.decode(response.body).map((x) => DetailModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }
}
