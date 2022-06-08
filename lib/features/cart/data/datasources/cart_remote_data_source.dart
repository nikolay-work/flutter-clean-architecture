import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/core/utils/settings.dart';
import 'package:phones_market/features/cart/data/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../core/http_client/retrofit_http_client.dart';

class CartRemoteDataSource {
  final RetrofitHttpClient client;

  CartRemoteDataSource({required this.client});

  Future<CartModel> getCartData() async {
    try {
      return await client.getCartData();
    } catch (err) {
      throw ServerException();
    }
  }
}

// class CartRemoteDataSource {
//   final http.Client client;
//
//   CartRemoteDataSource({required this.client});
//
//   Future<CartModel> getHomeData() async {
//     final response = await client
//         .get(Uri.parse("https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"));
//     if (response.statusCode == 200) {
//       return CartModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }
// }
