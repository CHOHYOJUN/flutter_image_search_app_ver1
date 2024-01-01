import 'package:flutter_image_search_app_ver1/data/dto/pixabay_dto.dart';

import '../model/image_item.dart';

extension DtoToModel on Hits {
  /// 변환하는 기능
  ImageItem toImageItem() {
    return ImageItem(
        imageUrl: previewURL ?? 'https://image.dongascience.com/Photo/2017/03/14884464688564.jpg',
        tags: tags ?? '',
        id: id ?? 0,
    );
  }
}
