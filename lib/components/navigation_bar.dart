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
            destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home, color: selectedIndex == 0 ? Colors.purple[300]! : Colors.grey[600]!),
                    label: "Index"
                ),
                NavigationDestination(
                    icon: Icon(Icons.favorite, color: selectedIndex == 1 ? Colors.purple[300]! : Colors.grey[600]!),
                    label: "Favourites"
                ),
                NavigationDestination(
                    icon: Icon(Icons.commute, color: selectedIndex == 2 ? Colors.purple[300]! : Colors.grey[600]!),
                    label: "Information"
                )
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected
        );
    }
}
