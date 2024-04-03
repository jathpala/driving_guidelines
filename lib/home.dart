// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";

import "components/app_bar.dart";
import "components/navigation_bar.dart";
import "views/index.dart";
// import "views/favourites.dart";
// import "views/information.dart";

class HomeScreen extends StatefulWidget {
    const HomeScreen({ super.key });

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    _HomeScreenState();

    int selectedIndex = 0;

    final Map<int, Map<String, dynamic>>_pages = {
        0: {
            "title": "Driving Guidelines",
            "page": const IndexPage()
        },
        1: {
            "title": "Favourites",
            "page": const Placeholder()
        },
        2: {
            "title": "Information",
            "page": const Placeholder()
        }
    };

    void onDestinationSelected(int index) {
        setState(() {
            selectedIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: MainAppBar(title: _pages[selectedIndex]?["title"]),
            bottomNavigationBar: MainNavBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.pushNamed(context, '/main');
                },
                child: const Icon(Icons.cached)
            ),
            body: _pages[selectedIndex]?["page"]
        );
    }
}
