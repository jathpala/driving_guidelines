import 'package:flutter/material.dart';

import 'src/style.dart';
import 'src/widgets/guideline.dart';
import 'src/widgets/guideline_list.dart';
import 'src/yaml.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    final double _PADDING = 16.0;

    // Application root.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Driving Guidelines',
            theme: defaultTheme,
            home: Scaffold(
                appBar: AppBar(
                    title: const Text('Driving Guidelines'),
                    titleTextStyle: defaultTheme.textTheme.headline1
                ),
                body: Container(
                    child: GuidelineList(),
                    padding: EdgeInsets.all(_PADDING)
                )
            )
        );
    }
}
