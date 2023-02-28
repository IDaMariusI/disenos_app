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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomeRadialProgress(percentage: percentage, color: Colors.blue),
              CustomeRadialProgress(percentage: percentage, color: Colors.red),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomeRadialProgress(percentage: percentage, color: Colors.pink),
              CustomeRadialProgress(
                  percentage: percentage, color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomeRadialProgress extends StatelessWidget {
  const CustomeRadialProgress({
    super.key,
    required this.percentage,
    required this.color,
  });

  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: color,
        secondaryColor: Colors.grey,
        primaryThickness: 10.0,
        secondaryThickness: 4.0,
      ),
    );
  }
}
