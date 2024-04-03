// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";

class MainNavBar extends StatelessWidget {
    const MainNavBar({ required this.selectedIndex, required this.onDestinationSelected, super.key });

    final int selectedIndex;
    final ValueChanged<int> onDestinationSelected;

    @override
    Widget build(BuildContext context) {
        return NavigationBar(
            destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home),
                    label: "Index"
                ),
                NavigationDestination(
                    icon: Icon(Icons.favorite),
                    label: "Favourites"
                ),
                NavigationDestination(
                    icon: Icon(Icons.commute),
                    label: "Information"
                )
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected
        );
    }
}
