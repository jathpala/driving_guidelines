/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/services.dart';

import 'dart:convert';

class IndexData {
    IndexData._(this.data);

    final dynamic data;

    static const _indexFilePath = 'assets/data/guidelines/';
    static const _indexFileName = 'index.json';

    static Future<IndexData> load() async {
        const file = _indexFilePath + _indexFileName;
        String doc = await rootBundle.loadString(file);
        dynamic json = jsonDecode(doc);
        return IndexData._(json);
    }
}
