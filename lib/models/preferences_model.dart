// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class PreferencesModel extends ChangeNotifier {
    PreferencesModel() {
        loadPreferences();
    }

    Set<String> favourites = {};
    late SharedPreferences _preferences;

    void toggleFavourite(String id) async {
        if (favourites.contains(id)) {
            favourites.remove(id);
        } else {
            favourites.add(id);
        }
        await _preferences.setStringList("favourites", favourites.toList());
        notifyListeners();
    }

    void loadPreferences() async {
        _preferences = await SharedPreferences.getInstance();
        favourites.addAll(_preferences.getStringList("favourites") ?? []);
        notifyListeners();
    }
}
