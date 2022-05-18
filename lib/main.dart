import 'package:flutter/material.dart';

import 'src/style.dart';
import 'src/widgets/index.dart';
import 'src/widgets/guideline.dart';


void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    // Application root.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Driving Guidelines',
            theme: defaultTheme,
            initialRoute: Index.routeName,
            onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                    case '/':
                        return null;
                        break;
                    case Index.routeName:
                        return MaterialPageRoute(
                            builder: (context) {
                                return Index();
                            }
                        );
                        break;
                    case Guideline.routeName:
                        final guideline = settings.arguments as String;
                        return MaterialPageRoute(
                            builder: (context) {
                                return Guideline(guideline);
                            }
                        );
                        break;
                    default:
                        assert(false, 'Need to implement ${settings.name}');
                        return null;
                        break;
                }
            }
        );
    }
}
