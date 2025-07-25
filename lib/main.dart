// main.dart
import 'package:bvg_transport_app/views/transport_info_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BVGApp());

class BVGApp extends StatelessWidget {
  const BVGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BVG Transport',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TransportInfoPage(),
    );
  }
}
