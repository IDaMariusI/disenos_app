import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
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
              CustomeRadialProgress(
                percentage: percentage * 1.2,
                color: Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomeRadialProgress(
                percentage: percentage * 1.4,
                color: Colors.pink,
              ),
              CustomeRadialProgress(
                percentage: percentage * 1.6,
                color: Colors.purple,
              ),
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: color,
        secondaryColor: appTheme.textTheme.bodyLarge!.color!,
        primaryThickness: 10.0,
        secondaryThickness: 4.0,
      ),
    );
  }
}
