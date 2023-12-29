import 'package:flutter/cupertino.dart';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class ImageModel with ChangeNotifier {
  final _repo = ImageItemRepository();
  String _query = '';
  List<ImageItem> _imageItems = [];
  bool isLoading = false;

  ImageModel() {
    fetch();
  }

  Future<void> fetch() async {
    isLoading = true; notifyListeners();
    imageItems = await _repo.getImageItems(query);
    isLoading = false; notifyListeners();

  }

  set query(String value) {
    _query = value;
  }

  String get query => _query;

  List<ImageItem> get imageItems => _imageItems;

  set imageItems(List<ImageItem> value) {
    _imageItems = value;
  }
}
