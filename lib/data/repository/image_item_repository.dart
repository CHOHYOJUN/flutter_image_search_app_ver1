import 'package:flutter_image_search_app_ver1/data/mapper/image_mapper.dart';

import '../data_source/pixabay_api.dart';
import '../model/image_item.dart';
import 'image_item_repository_impl.dart';

class ImageItemRepository implements ImageItemRepositoryImpl {
  final _api = PixabayApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    // 주의: await 요청하지 않으면 'dto.hits' 불가
    final dto = await _api.getImagesResult(query);
    if (dto.hits == null) return [];
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
