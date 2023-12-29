import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController textEditingController;

  /// 콜백 함수의 시그니처를 나타내는 특정 타입
  // final VoidCallback onPressed;

  /// Function은 모든 함수를 나타내는 범용 타입
  final Function() onPressed;

  const SearchInput({
    Key? key,
    required this.textEditingController,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: const TextStyle(color: Colors.green),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(fontSize: 16),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: ()=>onPressed,
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
