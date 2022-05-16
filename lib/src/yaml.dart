import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

Future<YamlMap> loadYAML(String guideline) async {
    var guideline_file = path.join('assets', 'data', 'guidelines', guideline + '.yaml');
    var doc = await rootBundle.loadString(guideline_file);
    var yaml = loadYaml(doc);
    return yaml;
}
