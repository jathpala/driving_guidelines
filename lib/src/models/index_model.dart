/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'guideline_model.dart';

class IndexModel extends ChangeNotifier {
    IndexModel() {
        loadIndex();
    }

    static const _indexFile = 'assets/guidelines/index.json';

    Map<String, GuidelineModel> guidelines = {};
    Map<String, Map<String, Map<String, String>>> sortedGuidelines = {};

    // Add a guideline entry to the list
    void add(String id, String name, List<String> categories, String group) {

        // Add to the main, flat guidelines map
        guidelines[id] = GuidelineModel(
            id: id,
            name: name,
            categories: categories,
            group: group
        );

        // Add to the nested guidelines map suited for the index view
        for (var category in categories) {
            if (!sortedGuidelines.containsKey(category)) {
                sortedGuidelines[category] = {};
            }
            if (!sortedGuidelines[category]!.containsKey(group)) {
                sortedGuidelines[category]![group] = {};
            }
            sortedGuidelines[category]![group]![id] = name;
        }
    }

    // Reads the index file and adds all entries to the guidelines list
    void loadIndex() async {
        String doc = await rootBundle.loadString(_indexFile);
        final json = jsonDecode(doc);
        json.forEach((id, data) {
            // The complex expression for categories converts the type from
            // List<dynamic> to List<String>
            add(id, data['name'], (data['categories'] as List).map((c) => c.toString()).toList(), data['group']);
        });
        notifyListeners();
    }
}
