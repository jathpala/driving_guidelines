/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'models/main_window_model.dart';
import 'models/index_model.dart';

import 'views/index.dart';
//import 'views/navigation.dart';
import 'views/components/main_nav_bar.dart';
import 'views/components/main_app_bar.dart';

class MainWindow extends StatefulWidget {
    const MainWindow({ Key? key }): super(key: key);

    /// Route name for navigation
    static const routeName = '/';

    @override
    State<MainWindow> createState() => _MainWindowState();
}


class _MainWindowState extends State<MainWindow> {
    _MainWindowState();

    //late Future<IndexData> index;
    //late Future<SharedPreferences> preferences;

    /*@override
    void initState() {
        super.initState();
        index = IndexData.load();
        preferences = SharedPreferences.getInstance();
        preferences.then((prefs) {
            var favourites = prefs.getStringList('favourites');
            if (favourites != null) {
                _favourites.addAll(favourites);
            }
        });
    }*/

    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (context) => MainWindowModel()),
                ChangeNotifierProvider(create: (context) => IndexModel())
            ],
            child: Scaffold(
                appBar: MainAppBar(),
                bottomNavigationBar: MainNavBar(),
                body: Consumer<MainWindowModel>(
                    builder: (context, view, child) => view.body
                )
            )
        );
    }
}
