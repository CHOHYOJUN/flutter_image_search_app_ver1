import 'package:flutter/cupertino.dart';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class ImageModel with ChangeNotifier {
  final _repo = ImageItemRepository();
  String _query = '';
  List<ImageItem> _imageItems = [];
  bool _isLoading = false;

  // 생성자
  ImageModel() {
    fetch();
  }

  /// _id repo -> 데이터
  ImageItem? inquireItem({required num id}) {
    if (_imageItems.isNotEmpty) {
      return _imageItems.firstWhere((image) => image.id == id);
    }
    return null;
  }

  Future<void> fetch() async {
    isLoading = true;
    notifyListeners();

    imageItems = await _repo.getImageItems(query);

    isLoading = false;
    notifyListeners();
  }

  // getter, setter

  set query(String value) {
    _query = value;
  }

  String get query => _query;

  List<ImageItem> get imageItems => _imageItems;

  set imageItems(List<ImageItem> value) {
    _imageItems = value;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }
}
