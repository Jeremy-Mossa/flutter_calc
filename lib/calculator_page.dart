import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _displayText = '0';  // Placeholder for display

  // List of all button labels (scientific layout: 5 columns, ~7 rows)
  final List<String> _buttons = [
    'sin', 'cos', 'tan', 'log', 'ln',
    'exp', 'sqrt', '^', 'pi', 'e',
    '7', '8', '9', '/', '(',
    '4', '5', '6', '*', ')',
    '1', '2', '3', '-', 'C',
    '0', '.', '=', '+', 'DEL',
    // Add more if needed, e.g., 'asin', 'acos' in extra rows
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Calc')),
      body: Column(
        children: [
          // Display area (unchanged from last step)
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              color: Colors.black87,
              child: Text(
                _displayText,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Keypad grid (new: buttons laid out)
          Expanded(
            flex: 3,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),  // Outer spacing
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,  // 5 buttons per row
                childAspectRatio: 2,  // Wider buttons (adjust for square: 1)
                crossAxisSpacing: 8,  // Space between columns
                mainAxisSpacing: 8,  // Space between rows
              ),
              itemCount: _buttons.length,  // Number of buttons
              itemBuilder: (context, index) {
                final label = _buttons[index];
                return _buildButton(label);  // Helper method below builds each button
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build styled buttons (UI-only)
  Widget _buildButton(String label) {
    Color bgColor;
    if (RegExp(r'[0-9\.]').hasMatch(label)) {
      bgColor = Colors.grey;  // Numbers: Gray
    } else if (['+', '-', '*', '/', '=', 'C', 'DEL'].contains(label)) {
      bgColor = Colors.blue;  // Ops: Blue
    } else {
      bgColor = Colors.orange;  // Scientific: Orange
    }

    return ElevatedButton(
      onPressed: () {
        // UI-only: Print to console for now (see in terminal when clicked)
        print('Button pressed: $label');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,  // Set color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),  // Rounded corners
        elevation: 4,  // Shadow for depth
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 24, color: Colors.white),  // White text, large
      ),
    );
  }
}
