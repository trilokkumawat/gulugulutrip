import 'package:flutter/material.dart';

class ErrorWidgetExample extends StatelessWidget {
  final String errorMessage;

  // ignore: use_key_in_widget_constructors
  const ErrorWidgetExample({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          const Text(
            'An error occurred:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: () {

          //   },
          //   child: const Text('Retry'),
          // ),
        ],
      ),
    );
  }
}
