import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class apiClient {
  static const APIKEY =
      '563492ad6f91700001000001be35d0817762410abbb548e153642e4e';
  late Response response;
  Dio dio = Dio();

  getPhotos(int page, String search) async {
    response = await dio
        .get(
          "https://api.pexels.com/v1/search?query=$search&per_page=10&page=$page",
          options: Options(
            headers: {'Authorization': 'Bearer $APIKEY'},
          ),
        )
        .timeout(const Duration(seconds: 15));
    if (kDebugMode) {
      print(response.data);
    }
    return response.data;
  }
}
