// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "models/page_model.dart";
import "components/app_bar.dart";
import "components/navigation_bar.dart";

class App extends StatefulWidget {
    const App({ super.key });

    @override
    State<App> createState() => _AppState();
}

class _AppState extends State<App> {
    _AppState();

    @override
    Widget build(BuildContext context) {
        return Consumer<PageModel>(
            builder: (context, page, child) => PopScope(
                canPop: page.isPrimaryPage,
                onPopInvoked: (bool didPop) {
                    if (!didPop) {
                        page.setActivePageByIndex(page.index);
                    }
                },
                child: Scaffold(
                    appBar: MainAppBar(title: page.title),
                    bottomNavigationBar: MainNavBar(
                        selectedIndex: page.index,
                        onDestinationSelected: page.setActivePageByIndex
                    ),
                    floatingActionButton: page.fab,
                    body: page.page
                )
            )
        );
    }
}
