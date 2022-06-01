/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../style.dart';
import '../../main_window.dart';
import '../../models/window_model.dart';

class MainNavBar extends StatelessWidget {
    const MainNavBar(this.route, { Key? key }): super(key: key);

    final String route;

    @override
    Widget build(BuildContext context) {
        return Consumer<WindowModel>(
            builder: (context, view, child) {
                return BottomNavigationBar(
                    items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Index'
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.favorite),
                            label: 'Favourites'
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.commute),
                            label: 'Information'
                        )
                    ],
                    selectedItemColor: (route == MainWindow.routeName)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).navBarUnselectedColor,
                    unselectedItemColor: Theme.of(context).navBarUnselectedColor,
                    backgroundColor: Theme.of(context).navBarColor,
                    currentIndex: view.index,
                    onTap: (index) {
                        view.setIndex(index);
                        if (route != MainWindow.routeName) {
                            Navigator.pop(context);
                        }
                    }
                );
            }
        );
    }
}
