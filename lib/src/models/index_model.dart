/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'guideline_model.dart';

class IndexModel extends ChangeNotifier {
    IndexModel() {
        load();
    }

    static const _indexFile = 'assets/guidelines/index.json';

    Map<String, GuidelineModel> guidelines = {};

    // Add a guideline entry to the list
    void add(String id, String name, List<String> categories, String group) {
        guidelines[id] = GuidelineModel(
            id: id,
            name: name,
            categories: categories,
            group: group
        );
        notifyListeners();
    }

    // Remove a guideline entry from the list
    void remove(String id) {
        guidelines.remove(id);
        notifyListeners();
    }

    // Reads the index file and adds all entries to the guidelines list
    void load() async {
        String doc = await rootBundle.loadString(_indexFile);
        final json = jsonDecode(doc);
        json.forEach((id, data) {
            // The complex expression for categories converts the type from
            // List<dynamic> to List<String>
            add(id, data['name'], (data['categories'] as List).map((c) => c.toString()).toList(), data['group']);
        });
    }
}
