/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../style.dart';
import '../../models/main_window_model.dart';

class MainNavBar extends StatelessWidget {
    const MainNavBar({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context) {
        return Consumer<MainWindowModel>(
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
                    selectedItemColor: (view.index != null)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).navBarUnselectedColor,
                    unselectedItemColor: Theme.of(context).navBarUnselectedColor,
                    backgroundColor: Theme.of(context).navBarColor,
                    currentIndex: view.index,
                    onTap: (index) => view.setIndex(index)
                );
            }
        );
    }
}
