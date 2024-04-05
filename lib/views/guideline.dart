// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
import "package:yaml/yaml.dart";

import "../models/page_model.dart";

import '../src/style.dart';
// import "../models/preferences_model.dart";
import "../src/widgets/guideline.dart";

class GuidelinePage extends StatefulWidget {
    const GuidelinePage(this.guideline, { super.key });

    static const id = "guideline";
    final String guideline;

    @override
    State<GuidelinePage> createState() => _GuidelinePageState();
}


class _GuidelinePageState extends State<GuidelinePage> {
    _GuidelinePageState();

    static const _guidelineFilePath = 'assets/guidelines/';
    static const _guidelineFileType = '.yaml';

    late Future<YamlMap> _data;

    @override
    void initState() {
        super.initState();

        final page = context.read<PageModel>();

        final file = _guidelineFilePath + widget.guideline + _guidelineFileType;
        _data = Future<YamlMap>(() => rootBundle.loadString(file).then((doc) {
            return loadYaml(doc);
        }))
        ..then((data) =>
            WidgetsBinding.instance.addPostFrameCallback((_) => page.title = data["name"])
        );
    }

    Future<YamlMap> runstate() async {
        final file = _guidelineFilePath + widget.guideline + _guidelineFileType;
        var doc = await rootBundle.loadString(file);
        return loadYaml(doc);
    }

    Widget buildTabBar(BuildContext context) {
        return Container(
            color: Theme.of(context).navBarColor,
            child: SizedBox(
                height: kToolbarHeight,
                child: TabBar(
                    tabs: const [
                        Tab(text: 'Private'),
                        Tab(text: 'Commercial')
                    ],
                    // Effectively hide the indicator
                    indicatorWeight: 0.001,
                    indicatorColor: Theme.of(context).navBarColor
                ),
            ),
        );
    }

    Widget buildBody() {
        return FutureBuilder(
            future: _data,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(child: TabBarView(
                        children: [
                            Guideline(snapshot.data!, false),
                            Guideline(snapshot.data!, true)
                        ]
                    ));
                } else {
                    return const Expanded(child: TabBarView(
                        children: [
                            CircularProgressIndicator(),
                            CircularProgressIndicator()
                        ]
                    ));
                }
            }
        );
    }

    // Widget buildFavouritesButton(BuildContext context) {
    //     return Consumer<PreferencesModel>(
    //         builder: (context, preferences, child) {
    //             return FloatingActionButton(
    //                 child: preferences.favourites.contains(widget.id) ?
    //                     Icon(Icons.favorite, color: Colors.red[700]) :
    //                     Icon(Icons.favorite_border, color: Theme.of(context).navBarUnselectedColor),
    //                 onPressed: () => preferences.toggleFavourite(widget.id),
    //                 backgroundColor: Theme.of(context).navBarColor
    //             );
    //         }
    //     );
    // }

    @override
    Widget build(BuildContext context) {
        return Consumer<PageModel>(
            builder: (context, page, child) => DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        buildTabBar(context),
                        buildBody()
                    ]
                )
            )
        );
    }
}
