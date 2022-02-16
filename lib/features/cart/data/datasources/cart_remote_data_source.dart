import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/utils/settings.dart';
import 'package:phones_market/features/cart/data/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSource({required this.client});

  Future<List<CartModel>> getHomeData() async {
    final response = await client
        .get(Uri.parse("https://shopapi-0575.restdb.io/rest/cart"), headers: {
      'Content-type': 'application/json',
      'x-apikey': Settings.apikey,
    });
    if (response.statusCode == 200) {
      return List<CartModel>.from(
          json.decode(response.body).map((x) => CartModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }
}