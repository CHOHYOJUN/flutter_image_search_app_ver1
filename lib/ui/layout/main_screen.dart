import 'package:flutter/material.dart';
import 'package:flutter_image_search_app_ver1/ui/layout/search_input.dart';

import 'image_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(title: const Text('앱 제목'),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              /// 검색 창
              SearchInput(),
              /// 여백
              SizedBox(height: 10),
              /// 리스트
              Expanded(
                child: ImageListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
