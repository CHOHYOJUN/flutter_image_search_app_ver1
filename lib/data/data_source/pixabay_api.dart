import 'dart:convert';

import 'package:flutter_image_search_app_ver1/data/dto/pixabay_dto.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  Future<PixabayDto> getImagesResult(query) async {
    String url =
        'https://pixabay.com/api/?key=41505033-08ab139acfeb5a600dc611dd9&q=${query}&image_type=photo';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PixabayDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('error: ${response.statusCode}');
    }
  }
}
