import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_search_app_ver1/ui/widget/title/TitleWidget.dart';
import 'package:flutter_image_search_app_ver1/view_model/image_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    return imageModel.isLoading
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            itemCount: imageModel.imageItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () async {
                    /// Navigator.push
                    // await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DetailPage(
                    //       imageItem: imageModel.imageItems[index],
                    //     ),
                    //   ),
                    // );

                    String jsonData = jsonEncode(imageModel.imageItems[index].toJson());

                    /// GoRouter
                    await context.push(
                      Uri(
                        path: '/detailPage',
                        queryParameters: {
                          'imageItem': jsonData
                        },
                      ).toString(),
                    );
                  },
                  child: Hero(
                    tag: 'image_${imageModel.imageItems[index]}',
                    child: // hero
                        ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        imageModel.imageItems[index].imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
          );
  } // _ImageListWidgetState
}

