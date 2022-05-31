/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style.dart';
import '../models/index_model.dart';

class Index extends StatefulWidget {
    const Index({ Key? key }): super(key: key);

    static const title = 'Driving Guidelines';

    @override
    State<Index> createState() => _IndexState();
}


class _IndexState extends State<Index> {
    _IndexState();

    /*late Future<IndexData> index;
    late Future<SharedPreferences> preferences;
    List<String> _favourites = [];
    List<bool>? _panelIsOpen;

    @override
    void initState() {
        super.initState();
        index = IndexData.load();
        preferences = SharedPreferences.getInstance();
        preferences.then((prefs) {
            var favourites = prefs.getStringList('favourites');
            if (favourites != null) {
                _favourites.addAll(favourites);
            }
        });
    }
    */

    @override
    Widget build(BuildContext context) {
        return Consumer<IndexModel>(
            builder: (context, index, child) {
                return Center(
                    child: Text(index.guidelines['coronary_artery_bypass_grafting']?.name ?? 'No name')
                );
            }
        );
    }
}
