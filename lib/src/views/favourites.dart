/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style.dart';
import '../guideline_window.dart';
import '../models/index_model.dart';
import '../models/preferences_model.dart';
import '../models/window_model.dart';


class Favourites extends StatefulWidget {
    const Favourites({ Key? key }): super(key: key);

    static const title = 'Favourites';

    @override
    State<Favourites> createState() => _FavouritesState();
}


class _FavouritesState extends State<Favourites> {
    _FavouritesState();

    ListTile buildListItem(BuildContext context, String id, Map<String, Map<String, Object>> guidelines, PreferencesModel preferences) {
        return ListTile(
            title: Text(
                (guidelines[id]?['name'] as String),
                style: Theme.of(context).textTheme.subtitle1
            ),
            trailing: IconButton(
                icon: Icon(
                    preferences.favourites.contains(id) ? Icons.favorite : Icons.favorite_border,
                    color: preferences.favourites.contains(id) ? Colors.red : Theme.of(context).navBarUnselectedColor
                ),
                onPressed: () {
                    preferences.toggleFavourite(id);
                }
            ),
            dense: false,
            onTap: () {
                Navigator.pushNamed(
                    context,
                    GuidelineWindow.routeName,
                    arguments: {
                        'guideline': id,
                    }
                );
            }
        );
    }

    List<Widget> buildList(BuildContext context, Map<String, Map<String, Object>> guidelines, PreferencesModel preferences) {
        List<Widget> navigationList = [];
        Map<String, List<String>> groupedGuidelines = {};
        // Gather guidelines by group
        for (var id in preferences.favourites) {
            if (!groupedGuidelines.containsKey(guidelines[id]?['group'])) {
                groupedGuidelines[(guidelines[id]?['group'] as String)] = [];
            }
            groupedGuidelines[guidelines[id]?['group']]?.add(id);
        }
        var firstGroup = true;
        groupedGuidelines.forEach((group, ids) {
            if (firstGroup) {
                firstGroup = false;
            } else {
                navigationList.add(const Divider());
            }
            for (var id in ids) {
                navigationList.add(buildListItem(context, id, guidelines, preferences));
            }
        });
        return navigationList;
    }

    @override
    Widget build(BuildContext context) {

        return Consumer2<IndexModel, PreferencesModel>(
            builder: (context, index, preferences, child) {
                if (preferences.favourites.length == 0) {
                    // No favourites
                    return Center(
                        child: Text(
                            'Favourited guidelines will appear here',
                            style: Theme.of(context).textTheme.smallText1
                        )
                    );
                } else {
                    //return Placeholder();
                    return ListView(
                        children: buildList(context, index.guidelines, preferences)
                    );
                }
            }
        );
    }
}
