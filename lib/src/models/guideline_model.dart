/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class GuidelineModel extends ChangeNotifier {
    GuidelineModel(this.id) {
        loadGuideline(id);
    }

    final String id;
    YamlMap? data;

    static const _guidelineFilePath = 'assets/guidelines/';
    static const _guidelineFileType = '.yaml';

    // Reads the specified guideline file
    void loadGuideline(String id) async {
        final file = _guidelineFilePath + id + _guidelineFileType;
        String doc = await rootBundle.loadString(file);
        data = loadYaml(doc);
        notifyListeners();
    }
}
