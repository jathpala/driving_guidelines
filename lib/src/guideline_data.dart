import 'package:flutter/services.dart';

import 'package:yaml/yaml.dart';

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
