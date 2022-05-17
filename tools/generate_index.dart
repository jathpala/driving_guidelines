/// Generate an index file of all guideline.yaml files for use
/// in building the main navigation of the app.

import 'dart:io';
import 'dart:convert';

import 'package:path/path.dart';

import 'package:yaml/yaml.dart';

final GUIDELINE_DIR = join('assets', 'data', 'guidelines');
const INDEX_FILE = 'index.json';

void main() {

    // Get all
    final contents = Directory(GUIDELINE_DIR)
        .listSync(recursive: true)
        .toList();
    final files = contents.whereType<File>().where((filename) => basename(filename.path) != INDEX_FILE);

    // Create a dictionary of guideline filenames and human readable names
    final Map<String, String> index = {};
    files.forEach((f) {
        var contents = f.readAsStringSync();
        var yaml = loadYaml(contents);
        var name = yaml['name'].split('(')[0].trim();
        var filename = basename(f.path).split('.')[0];
        index[filename] = name;
    });

    // Write JSON to the index file
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final outfile = join(GUIDELINE_DIR, INDEX_FILE);
    File(outfile).writeAsStringSync(
        encoder.convert(index)
    );

    print('Generated index at ${outfile} with ${index.length} items.');

}
