import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cannot use keyword const on AppBar, error
      appBar: AppBar(title: const Text('Flutter Calc')),
      body: const Center(
        child: const Text('Calculator Page Placeholder'),
      ),
    );
  }
}
