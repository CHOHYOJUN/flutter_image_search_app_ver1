import 'package:flutter/material.dart';

import '../../data/model/image_item.dart';
import '../widget/images/default_image_widget.dart';
import '../widget/title/TitleWidget.dart';

class DetailPage extends StatelessWidget {
  final ImageItem imageItem;

  const DetailPage({
    Key? key,
    required this.imageItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageItem);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          text: '제목',
        ),
        Expanded(
          child: //
              DefaultImageWidget(
            networkUrl: imageItem.imageUrl,
          ),
        ),
      ],
    );
  }
}
