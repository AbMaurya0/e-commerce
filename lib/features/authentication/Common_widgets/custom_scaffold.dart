import 'package:flutter/material.dart';

class MyCustomScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;

  const MyCustomScaffold({
    Key? key,
    required this.body,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.pink, Colors.green, Colors.purple],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: body,
      ),
    );
  }
}
