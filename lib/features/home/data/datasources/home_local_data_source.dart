import 'dart:convert';

import 'package:phones_market/core/error/exception.dart';
import 'package:phones_market/features/home/data/models/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataSource {
  Future<List<HomeModel>> getHomeDataFromCache();
  Future<void> addHomeDataToCache(List<HomeModel> homeData);
}

const cachedHomeData = 'CACHED_HOME_DATA';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferences sharedPreferences;

  HomeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<HomeModel>> getHomeDataFromCache() {
    final String? jsonHome = sharedPreferences.getString(cachedHomeData);

    if (jsonHome != null) {
      return Future.value(List<HomeModel>.from(
          json.decode(jsonHome).map((x) => HomeModel.fromJson(x))));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> addHomeDataToCache(List<HomeModel> homeData) async {
    final String jsonHome =
        json.encode(List<dynamic>.from(homeData.map((x) => x.toJson())));

    await sharedPreferences.setString(cachedHomeData, jsonHome);
    //return Future.value(jsonHome);
  }
}
