import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/widgets.dart';

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
        child: Container(
          width: 400,
          height: 400,
          color: Colors.red,
          child: RadialProgress(percentage: 40.0),
        ),
      ),
    );
  }
}
