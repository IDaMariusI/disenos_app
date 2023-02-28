import 'package:flutter/material.dart';

class CircleGraphsPage extends StatefulWidget {
  const CircleGraphsPage({super.key});

  @override
  State<CircleGraphsPage> createState() => _CircleGraphsPageState();
}

class _CircleGraphsPageState extends State<CircleGraphsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10.0;
            if (percentage > 100.0) {
              percentage = 0.0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Text(
          '$percentage%',
          style: const TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
