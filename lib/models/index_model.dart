// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndexModel extends ChangeNotifier {
    IndexModel() {
        loadIndex();
    }

    static const _indexFile = 'assets/guidelines/index.json';

    Index? index;

    // Reads the index file and adds all entries to the guidelines list
    void loadIndex() async {
        String doc = await rootBundle.loadString(_indexFile);
        Map<String, dynamic> json = jsonDecode(doc);
        index = Index(json);
        notifyListeners();
    }
}

class Index {
    Index(indexData) {
        indexData.forEach((key, value) {
            IndexItem item = IndexItem(id: key, name: value["name"]);
            for (String categoryId in value["categories"]) {
                IndexCategory indexCategory = _indexData.firstWhere(
                    (category) => category.id == categoryId,
                    orElse: () {
                        IndexCategory category = IndexCategory(id: categoryId);
                        _indexData.add(category);
                        return category;
                    }
                );
                indexCategory.add(item, value["group"]);
            }
        });
    }

    final List<IndexCategory> _indexData = [];

    List<IndexCategory> get categories => _indexData;
}

class IndexItem {
    IndexItem({ required this.id, required this.name });

    final String id;
    final String name;
}

class IndexGroup {
    IndexGroup({ required this.id });

    final String id;

    List<IndexItem> items = [];

    void add(IndexItem newItem) {
        items.removeWhere((oldItem) => oldItem.id == newItem.id);
        items.add(newItem);
    }
}

class IndexCategory {
    IndexCategory({ required this.id, this.isExpanded = false });

    final String id;
    bool isExpanded;

    List<IndexGroup> groups = [];

    String get name {
        return switch (id) {
            "cardiovascular" => "Cardiovascular",
            "blackouts" => "Syncope",
            "other" => "Other",
            _ => "UNKNOWN"
        };
    }

    void add(IndexItem item, String groupId) {
        IndexGroup group = groups.firstWhere(
            (group) => group.id == groupId,
            orElse: () {
                IndexGroup group = IndexGroup(id: groupId);
                groups.add(group);
                return group;
            }
        );
        group.add(item);
    }
}