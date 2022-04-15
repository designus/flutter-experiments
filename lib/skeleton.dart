import 'package:flutter/material.dart';
import 'package:friendly_chat/nav_drawer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    required this.title,
    required this.body
  }) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(title),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0, // NEW
      ),
      body: body
    );
  }
}