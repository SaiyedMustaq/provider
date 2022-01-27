//https://techcrunch.com/wp-json/wp/v2/posts?per_page=10&context=embed
//https://api.fda.gov/food/enforcement.json?limit=10
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_app/network/apiClient.dart';
import 'package:provider_app/provider/paginationTwo/PaginationModelTwo.dart';

class PaginationTwoProvider extends ChangeNotifier {
  int _page = 1;
  int get page => _page;

  List<PaginationModelTwo> _listModelTwo = <PaginationModelTwo>[];
  List<PaginationModelTwo> get modleList => _listModelTwo;

  set page(int pageIndex) {
    _page = pageIndex;
    notifyListeners();
  }

  set modelList(List<PaginationModelTwo> listValue) {
    _listModelTwo = listValue;
    notifyListeners();
  }

  Future<void> callModelTwoApi() async {
    try {
      await apiClient().dio.get("").then((value) {
        addSeconModelList(
            PaginationModelTwo.fromJson(jsonDecode(value.toString())));
        _page = _page + 1;
      });
      // ignore: empty_catches
    } on DioError {}
  }

  void addSeconModelList(PaginationModelTwo modelList) {
    _listModelTwo.addAll([modelList]);
    notifyListeners();
  }
}
