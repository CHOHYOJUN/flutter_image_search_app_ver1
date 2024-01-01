import 'package:flutter/material.dart';

class DefaultImageWidget extends StatelessWidget {
  final String networkUrl;

  const DefaultImageWidget({super.key, required this.networkUrl});

  @override
  Widget build(BuildContext context) {
    return
      Image.network(
        networkUrl,
        fit: BoxFit.fitWidth, // 이미지를 가로 크기에 맞게 채웁니다
      );
  }
}
