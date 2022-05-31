/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/services.dart';

import 'package:yaml/yaml.dart';

class GuidelineModel {
    GuidelineModel({
        required this.id,
        required this.name,
        required this.categories,
        required this.group,
        this.isFavourite = false,
        this.data
    });

    final String id;

    final String name;

    final List<String> categories;

    final String group;

    bool isFavourite;

    dynamic? data;
}

/*
class GuidelineData {
    GuidelineData._(this.data);

    final YamlMap data;

    static const _guidelineFilePath = 'assets/data/guidelines/';
    static const _guidelineFileType = '.yaml';

    static Future<GuidelineData> load(String id) async {
        final file = _guidelineFilePath + id + _guidelineFileType;
        String doc = await rootBundle.loadString(file);
        YamlMap yaml = loadYaml(doc);
        return GuidelineData._(yaml);
    }
}
*/
