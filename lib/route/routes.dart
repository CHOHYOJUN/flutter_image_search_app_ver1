
import 'package:flutter/cupertino.dart';
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
        final uri = Uri.parse(state.uri.toString());
        final queryParams = uri.queryParameters;
        final String id = queryParams['id'] ?? '';

        /// 직렬화, 역직열화로 데이터 전달
        // final ImageItem imageItems = ImageItem.fromJson(jsonDecode(state.uri.queryParameters['imageItem']!));

        return DetailPage(id: id);
      },
    ),
  ],
);