import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/navigate/navigate_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(NavigateRoutes.detail.withParaf, arguments: 'abc');
        },
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
