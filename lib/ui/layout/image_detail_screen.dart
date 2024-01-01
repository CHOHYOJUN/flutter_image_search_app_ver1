import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/image_model.dart';

class DetailPage extends StatelessWidget {
  final String id;

  const DetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageModel = Provider.of<ImageModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(imageModel
            .inquireItem(id: num.tryParse(id) ?? 0)!
            .tags),
      )
      ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const TitleWidget(text: '제목',fontSize: 100,color: Colors.black,),
          Expanded( child: //
            DefaultImageWidget(
              networkUrl: imageModel
                  .inquireItem(id: num.tryParse(id) ?? 0)!
                  .imageUrl,
            ),
          )
        ],
      ),
    );
  }
}


class DefaultImageWidget extends StatelessWidget {
  final String networkUrl;

  const DefaultImageWidget({Key? key, required this.networkUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Image.network(
        networkUrl,
        fit: BoxFit.fitWidth, // 이미지를 가로 크기에 맞게 채웁니다
      );
  }
}