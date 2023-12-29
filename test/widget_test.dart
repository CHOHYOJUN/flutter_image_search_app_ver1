// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_image_search_app_ver1/data/data_source/pixabay_api.dart';
import 'package:flutter_image_search_app_ver1/data/repository/image_item_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_image_search_app_ver1/main.dart';

import 'package:flutter_image_search_app_ver1/data/mapper/image_mapper.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  test('api 응답 테스트', () async {
    final _api = PixabayApi();

    final dto = await _api.getImagesResult('apple');

    print(dto.hits);
  });
}

