import 'package:flutter/material.dart';
import 'package:hotel_app/core/utils/app_route.dart';
import 'package:hotel_app/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
