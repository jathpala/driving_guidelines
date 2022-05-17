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

    final Map<String, String> routes = const {
        'coronary_artery_bypass_grafting': 'Coronary Artery Bypass Grafting',
        'percutaneous_coronary_intervention': 'Percutaneous Coronary Intervention'
    };

    // Application root.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Driving Guidelines',
            theme: defaultTheme,
            //home: Guideline('coronary_artery_bypass_grafting')
            home: GuidelineList(routes),
        );
    }
}
