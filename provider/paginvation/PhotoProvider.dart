import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../apiClient.dart';
import 'PhotoModel.dart';

class PhotoProvider extends ChangeNotifier {
  int _page = 1;
  int get page => _page;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isNetworkAvailable = true;
  bool get isNetworkAvailable => _isNetworkAvailable;

  List<Photos> _photos = <Photos>[];
  List<Photos> get photos => _photos;

  set page(int pageIndex) {
    _page = pageIndex;
    notifyListeners();
  }

  set loading(bool isLoad) {
    _isLoading = isLoad;
    notifyListeners();
  }

  set photos(List<Photos> value) {
    _photos = value;
    notifyListeners();
  }

  Future<void> callPhotoApi() async {
    try {
      await apiClient().getPhotos(_page, 'nature').then((response) {
        _page = _page + 1;
        addPhotosToList(PhotosModel.fromJson(response).photos!);
      });
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        log('${e.response?.statusCode}', error: "Status Code");
      } else {
        log(e.message, error: "Message");
      }
    }
    notifyListeners();
  }

  void addPhotosToList(List<Photos> photoData) {
    _photos.addAll(photoData);
    _isLoading = false;
    notifyListeners();
  }
}
