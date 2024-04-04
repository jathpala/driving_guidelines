// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "models/page_model.dart";
import "components/app_bar.dart";
import "components/navigation_bar.dart";

class HomeScreen extends StatefulWidget {
    const HomeScreen({ super.key });

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    _HomeScreenState();

    @override
    Widget build(BuildContext context) {
        return Consumer<PageModel>(
            builder: (context, page, child) => Scaffold(
                appBar: MainAppBar(title: page.title),
                bottomNavigationBar: MainNavBar(
                    selectedIndex: page.index ?? 0,
                    onDestinationSelected: page.handleNavBarSelection
                ),
                body: page.page
            )
        );
    }
}
