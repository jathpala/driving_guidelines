// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../models/preferences_model.dart";


class FavouriteFab extends StatefulWidget {
    const FavouriteFab(this.id, { super.key });

    final String id;

    @override
    State<FavouriteFab> createState() => _FavouriteFabState();
}


class _FavouriteFabState extends State<FavouriteFab> {
    _FavouriteFabState();

    @override
    Widget build(BuildContext context) {
        return Consumer<PreferencesModel>(
            builder: (context, preferences, child) {
                return FloatingActionButton(
                    child: preferences.favourites.contains(widget.id) ?
                        Icon(Icons.favorite, color: Theme.of(context).colorScheme.onSecondary) :
                        const Icon(Icons.favorite_border),
                    onPressed: () => preferences.toggleFavourite(widget.id),
                );
            }
        );
    }
}
