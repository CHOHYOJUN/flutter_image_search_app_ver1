
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_image_search_app_ver1/data/model/image_item.dart';
import 'package:go_router/go_router.dart';

import '../ui/layout/image_detail_screen.dart';
import '../ui/layout/main_screen.dart';

final GoRouter $Router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => MainScreen(),
    ),
    GoRoute(
      path: '/detailPage',
      builder: (BuildContext context, GoRouterState state) {
        /// 일반 파라메터 전달
        // final uri = Uri.parse(state.uri.toString());
        // final queryParams = uri.queryParameters;
        // final double height = double.tryParse(queryParams['height'] ?? '') ??  0.0;
        // final double weight = double.tryParse(queryParams['weight'] ?? '') ??  0.0;

        /// 직렬화, 역직열화로 데이터 전달
        final ImageItem imageItems = ImageItem.fromJson(jsonDecode(state.uri.queryParameters['imageItem']!));

        return DetailPage(imageItem: imageItems);
      },
    ),
  ],
);