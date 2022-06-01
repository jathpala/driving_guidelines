/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/window_model.dart';
import 'models/index_model.dart';
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

    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (context) => IndexModel(),
            child: Scaffold(
                appBar: const MainAppBar(),
                bottomNavigationBar: const MainNavBar(MainWindow.routeName),
                body: Consumer<WindowModel>(
                    builder: (context, view, child) => view.mainWindowBody
                )
            )
        );
    }
}
