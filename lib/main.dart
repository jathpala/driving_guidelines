import 'package:flutter/material.dart';

import 'src/style.dart';
import 'src/widgets/index.dart';
import 'src/widgets/information.dart';
import 'src/widgets/favourites.dart';
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
                MaterialPageRoute? route;
                switch (settings.name) {
                    case '/':
                        route = null;
                        break;
                    case Index.routeName:
                        route = MaterialPageRoute(
                            builder: (context) {
                                return const Index();
                            }
                        );
                        break;
                    case Favourites.routeName:
                        route = MaterialPageRoute(
                            builder: (context) {
                                return const Favourites();
                            }
                        );
                        break;
                    case Information.routeName:
                        route = MaterialPageRoute(
                            builder: (context) {
                                return const Information();
                            }
                        );
                        break;
                    case Guideline.routeName:
                        final guideline = settings.arguments as String;
                        route = MaterialPageRoute(
                            builder: (context) {
                                return Guideline(guideline);
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
        );
    }
}
