import 'package:flutter/material.dart';
class TestUis extends StatefulWidget {
  const TestUis({super.key});

  @override
  State<TestUis> createState() => _TestUisState();
}

class _TestUisState extends State<TestUis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
    );
  }
}
