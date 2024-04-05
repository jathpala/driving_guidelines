// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "home.dart";
import "models/index_model.dart";
import "models/preferences_model.dart";
import "models/page_model.dart";

import 'package:driving_guidelines/src/style.dart';

class DrivingGuidelines extends StatelessWidget {
    const DrivingGuidelines({super.key});

    // Application root.
    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (context) => PageModel()),
                ChangeNotifierProvider(create: (context) => IndexModel()),
                ChangeNotifierProvider(create: (context) => PreferencesModel()),
            ],
            child: MaterialApp(
                title: 'Driving Guidelines',
                theme: defaultTheme,
                home: const HomeScreen(),
                // home: const MainWindow(),
                //initialRoute: Index.routeName,
                // onGenerateRoute: (RouteSettings settings) {
                //     MaterialPageRoute? route;
                //     switch (settings.name) {
                //         case MainWindow.routeName:
                //             route = MaterialPageRoute(
                //                 builder: (context) {
                //                     return const MainWindow();
                //                 }
                //             );
                //             break;
                //         case GuidelineWindow.routeName:
                //             final guideline = (settings.arguments as Map)['guideline'] as String;
                //             route = MaterialPageRoute(
                //                 builder: (context) {
                //                     return GuidelineWindow(guideline);
                //                 }
                //             );
                //             break;
                //         default:
                //             assert(false, 'Need to implement ${settings.name}');
                //             route = null;
                //             break;
                //     }
                //     return route;
                // }
            )
        );
    }
}
