import 'package:flutter/material.dart';
import 'package:flutter_image_search_app_ver1/ui/layout/main_screen.dart';
import 'package:flutter_image_search_app_ver1/view_model/image_model.dart';
import 'package:provider/provider.dart';
import 'route/routes.dart';


void main() {
  runApp(ChangeNotifierProvider.value(
    value: ImageModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: $Router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MainScreen(),
    );
  }
}
