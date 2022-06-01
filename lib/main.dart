/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/style.dart';
import 'src/main_window.dart';
import 'src/guideline_window.dart';
import 'src/models/window_model.dart';
import 'src/models/preferences_model.dart';


void main() {
    runApp(const DrivingGuidelines());
}

class DrivingGuidelines extends StatelessWidget {
    const DrivingGuidelines({Key? key}) : super(key: key);

    // Application root.
    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (context) => WindowModel()),
                ChangeNotifierProvider(create: (context) => PreferencesModel())
            ],
            child: MaterialApp(
                title: 'Driving Guidelines',
                theme: defaultTheme,
                //initialRoute: Index.routeName,
                onGenerateRoute: (RouteSettings settings) {
                    MaterialPageRoute? route;
                    switch (settings.name) {
                        case MainWindow.routeName:
                            route = MaterialPageRoute(
                                builder: (context) {
                                    return const MainWindow();
                                }
                            );
                            break;
                        case GuidelineWindow.routeName:
                            final guideline = (settings.arguments as Map)['guideline'] as String;
                            final showCommercialStandard = (settings.arguments as Map)['showCommercialStandard'] as bool;
                            route = MaterialPageRoute(
                                builder: (context) {
                                    //return GuidelineWindow(guideline, showCommercialStandard);
                                    return GuidelineWindow('coronary_artery_bypass_grafting');
                                }
                            );
                            break;
                        default:
                            assert(false, 'Need to implement ${settings.name}');
                            route = null;
                            break;
                    }
                    return route;
                }
            )
        );
    }
}
