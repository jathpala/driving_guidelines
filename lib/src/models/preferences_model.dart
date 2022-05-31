/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'guideline_model.dart';

class PreferencesModel extends ChangeNotifier {
    PreferencesModel() {
        loadPreferences();
    }

    Set<String> favourites = {};
    late Future<SharedPreferences> _preferences;

    void toggleFavourite(String id) {
        if (favourites.contains(id)) {
            favourites.remove(id);
        } else {
            favourites.add(id);
        }
        _preferences.then((p) => p.setStringList('favourites', favourites.toList()));
        notifyListeners();
    }

    void loadPreferences() async {
        _preferences = SharedPreferences.getInstance();
        _preferences.then((p) {
            if (p.getStringList('favourites') != null) {
                favourites.addAll(p.getStringList('favourites')!);
            }
        });
        notifyListeners();
    }
}
