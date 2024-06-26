// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

// Generate an index file of all guideline.yaml files for use
// in building the main navigation of the app.

import "dart:convert";
import "dart:io";

import "package:path/path.dart";

import "package:yaml/yaml.dart";

final guidelineDir = join("assets", "guidelines");
const indexFile = "index.json";

void main() {

    // Get all
    final contents = Directory(guidelineDir)
        .listSync(recursive: true)
        .toList();
    final files = contents.whereType<File>().where((filename) => basename(filename.path) != indexFile);

    // Create a dictionary of guideline filenames and human readable names
    final Map<String, Map<String, Object>> index = {};
    for (var f in files) {
        var contents = f.readAsStringSync();
        var yaml = loadYaml(contents);
        var id = basename(f.path).split(".")[0];
        index[id] = {};
        index[id]!["name"] = yaml["name"];
        index[id]!["categories"] = yaml["categories"];
        index[id]!["group"] = yaml["group"];
        index[id]!["format"] = yaml["format"] ?? "legacy";
    }

    // Write JSON to the index file
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final outfile = join(guidelineDir, indexFile);
    File(outfile).writeAsStringSync(
        encoder.convert(index)
    );

    var categories = <String>{};
    index.forEach((k, v) {
        for(var c in (v["categories"] as List<dynamic>)) {
            categories.add(c);
        }
    });

    print("\nGenerated index at $outfile with ${index.length} guidelines.");
    print("\nCategories:");
    for (var c in categories) {
        print(' $c');
    }
}
