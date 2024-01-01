import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_search_app_ver1/view_model/image_model.dart';

class SearchInput extends StatefulWidget {

  /// 콜백 함수의 시그니처를 나타내는 특정 타입
  // final VoidCallback onPressed;

  /// Function은 모든 함수를 나타내는 범용 타입
  // final Function() onPressed;

  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(); // 초기화 추가
  }


  @override
  Widget build(BuildContext context) {
    final imageModel = Provider.of<ImageModel>(context);

    return TextField(
      controller: _textEditingController,
      style: const TextStyle(color: Colors.green),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(fontSize: 16),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: (){
            imageModel.query=_textEditingController.text;
            imageModel.fetch();
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
