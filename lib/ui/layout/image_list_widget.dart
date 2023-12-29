import 'package:flutter/material.dart';
import 'package:flutter_image_search_app_ver1/viewmodel/image_model.dart';
import 'package:provider/provider.dart';

import '../../data/repository/image_item_repository.dart';

class ImageListWidget extends StatefulWidget {
  const ImageListWidget({Key? key}) : super(key: key);

  @override
  State<ImageListWidget> createState() => _ImageListWidgetState();
}

class _ImageListWidgetState extends State<ImageListWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageModel = Provider.of<ImageModel>(context);
    return
      imageModel.isLoading ? const Center(child: CircularProgressIndicator()) :
      GridView.builder(
      itemCount: imageModel.imageItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            imageModel.imageItems[index].imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
    );
  }
}
