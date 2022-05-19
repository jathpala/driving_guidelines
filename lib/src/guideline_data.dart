import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yaml/yaml.dart';

class GuidelineData {
    GuidelineData._(YamlMap this.data);

    final YamlMap data;

    static const _GUIDELINE_FILE_PATH = 'assets/data/guidelines/';
    static const _GUIDELINE_FILE_TYPE = '.yaml';

    static Future<GuidelineData> load(String id) async {
        final file = _GUIDELINE_FILE_PATH + id + _GUIDELINE_FILE_TYPE;
        String doc = await rootBundle.loadString(file);
        YamlMap yaml = loadYaml(doc);
        return GuidelineData._(yaml);
    }
}
