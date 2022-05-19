/// Generate an index file of all guideline.yaml files for use
/// in building the main navigation of the app.

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

import 'package:yaml/yaml.dart';

final guidelineDir = join('assets', 'data', 'guidelines');
const indexFile = 'index.json';

void main() {

    // Get all
    final contents = Directory(guidelineDir)
        .listSync(recursive: true)
        .toList();
    final files = contents.whereType<File>().where((filename) => basename(filename.path) != indexFile);

    // Create a dictionary of guideline filenames and human readable names
    final Map<String, String> index = {};
    for (var f in files) {
        var contents = f.readAsStringSync();
        var yaml = loadYaml(contents);
        var name = yaml['name'].split('(')[0].trim();
        var filename = basename(f.path).split('.')[0];
        index[filename] = name;
    }

    // Write JSON to the index file
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final outfile = join(guidelineDir, indexFile);
    File(outfile).writeAsStringSync(
        encoder.convert(index)
    );

    print('Generated index at $outfile with ${index.length} items.');
}
