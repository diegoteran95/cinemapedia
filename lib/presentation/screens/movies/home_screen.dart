import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";
  final StatefulNavigationShell childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: CustomBottomNavigation(
        navigationShell: childView,
      ),
    );
  }
}
