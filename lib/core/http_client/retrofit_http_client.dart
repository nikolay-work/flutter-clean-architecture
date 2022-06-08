import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../features/cart/data/models/cart_model.dart';
import '../../features/detail/data/models/detail_model.dart';
import '../../features/home/data/models/home_model.dart';

part 'retrofit_http_client.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class RetrofitHttpClient {
  factory RetrofitHttpClient(Dio dio, {String baseUrl}) = _RetrofitHttpClient;

  @GET("/654bd15e-b121-49ba-a588-960956b15175")
  Future<HomeModel> getHomeData();

  @GET("/6c14c560-15c6-4248-b9d2-b4508df7d4f5")
  Future<DetailModel> getDetailData();

  @GET("/53539a72-3c5f-4f30-bbb1-6ca10d42c149")
  Future<CartModel> getCartData();
}