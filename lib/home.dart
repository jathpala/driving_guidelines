/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/views/components/main_nav_bar.dart';
import 'src/views/components/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({ super.key });

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}


// class _HomeScreenState extends State<HomeScreen> {
//     _HomeScreenState();

//     @override
//     Widget build(BuildContext context) {
//         return ChangeNotifierProvider(
//             create: (context) => IndexModel(),
//             child: Scaffold(
//                 appBar: const MainAppBar(),
//                 bottomNavigationBar: const MainNavBar(MainWindow.routeName),
//                 body: Consumer<WindowModel>(
//                     builder: (context, view, child) => view.mainWindowBody
//                 )
//             )
//         );
//     }
// }


class _HomeScreenState extends State<HomeScreen> {
    _HomeScreenState();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: const MainAppBar(),
            bottomNavigationBar: const MainNavBar('/'),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.pushNamed(context, '/main');
                },
                child: const Icon(Icons.cached)
            ),
            body: Center(
                child: TextButton(
                    onPressed: () {
                        Navigator.pushNamed(
                            context,
                            '/main',
                        );
                    },
                    child: const Text('Go to old app')
                )
            )
        );
    }
}
