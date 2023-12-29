import 'package:flutter/material.dart';
import 'package:flutter_image_search_app_ver1/data/model/image_item.dart';

import '../../data/repository/image_item_repository.dart';

class ImageListWidget extends StatefulWidget {
  final String searchText;

  const ImageListWidget({Key? key, required this.searchText}) : super(key: key);

  @override
  State<ImageListWidget> createState() => _ImageListWidgetState();
}

class _ImageListWidgetState extends State<ImageListWidget> {
  final ImageItemRepository repo = ImageItemRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    searchImage(widget.searchText);
    setState(() {});
  }

  /// 데이터 출력
  void checkData() async {
    print(widget.searchText);

    // setState(() {
    //   isLoading = true;
    // });

    imageItems =  await searchImage(widget.searchText);

    // setState(() {
    //   isLoading = true;
    // });

  }

  Future<List<ImageItem>> searchImage(String query) async {
    return await repo.getImageItems(query);
  }

  @override
  Widget build(BuildContext context) {

    checkData();

    return
        isLoading ? const Center(child: CircularProgressIndicator()) :
      GridView.builder(
      itemCount: imageItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            imageItems[index].imageUrl,
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
