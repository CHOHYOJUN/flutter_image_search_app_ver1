import '../model/image_item.dart';

abstract interface class ImageItemRepositoryImpl {
  Future<List<ImageItem>> getImageItems(String query);
}
