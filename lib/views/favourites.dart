// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../models/index_model.dart";
import "../models/preferences_model.dart";
import "../models/page_model.dart";

import "guideline.dart";


class FavouritesPage extends StatefulWidget {
    const FavouritesPage ({ super.key });

    static const id = "favourites";
    final title = "Favourites";

    @override
    State<FavouritesPage> createState() => _FavouritesPageState();
}


class _FavouritesPageState extends State<FavouritesPage> {
    _FavouritesPageState();

    @override
    void initState() {
        super.initState();
        final page = context.read<PageModel>();
        WidgetsBinding.instance.addPostFrameCallback((_) => page.title = widget.title);
    }

    List<Widget> buildList(BuildContext context, Map<String, dynamic>index, PreferencesModel preferences, PageModel page) {

        // Group all favourited guidelines
        Map<String, Set<String>> groupedFavourites = {};
        for (String item in preferences.favourites) {
            String g = index[item]["group"];
            Set<String> group = groupedFavourites.putIfAbsent(g, () => {});
            group.add(item);
        }

        // Build widget list
        List<Widget> widgetList = [];
        bool firstGroup = true;
        groupedFavourites.forEach((String group, Set<String>items) {
            if (!firstGroup) {
                widgetList.add(Container(
                    color: Theme.of(context).colorScheme.background,
                    child: const Divider()
                ));
            }
            widgetList.addAll(items.map<ListTile>((String item) => ListTile(
                title: Text(
                    index[item]["name"],
                    style: Theme.of(context).listTileTheme.subtitleTextStyle
                ),
                trailing: IconButton(
                    icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).colorScheme.onSecondary
                    ),
                    onPressed: () => preferences.toggleFavourite(item)
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                minVerticalPadding: 0.0,
                onTap: () {
                    page.setActivePage(GuidelinePage.id, arguments: { "guideline": item });
                }
            )));
            firstGroup = false;
        });
        return widgetList;
    }

    @override
    Widget build(BuildContext context) {
        return Consumer3<IndexModel, PreferencesModel, PageModel>(
            builder: (context, index, preferences, page, child) {
                if (preferences.favourites.isEmpty) {
                    // No favourites
                    return const Center(
                        child: Text(
                            'Favourited guidelines will appear here',
                        )
                    );
                } else {
                    return ListView(
                        children: buildList(context, index.flatIndex ?? {}, preferences, page)
                    );
                }
            }

        );
    }
}
