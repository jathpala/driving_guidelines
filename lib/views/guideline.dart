// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
import "package:yaml/yaml.dart";

import "../models/page_model.dart";
import "../theme.dart";
import "../widgets/guideline_licence.dart";
import "../widgets/guideline_non_driving.dart";
import "../widgets/guideline_note.dart";

class GuidelinePage extends StatefulWidget {
    const GuidelinePage(this.guideline, { super.key });

    static const id = "guideline";
    final String guideline;

    @override
    State<GuidelinePage> createState() => _GuidelinePageState();
}


class _GuidelinePageState extends State<GuidelinePage> with SingleTickerProviderStateMixin {
    _GuidelinePageState();

    static const _guidelineFilePath = 'assets/guidelines/';
    static const _guidelineFileType = '.yaml';

    late TabController _tabController;
    late Future<YamlMap> _data;

    static const List<Tab> _tabs = [
        Tab(text: "Private"),
        Tab(text: "Commercial")
    ];

    @override
    void initState() {
        super.initState();

        _tabController = TabController(vsync: this, length: _tabs.length)
        ..addListener(() {
            setState(() {});
        });

        final page = context.read<PageModel>();

        final file = _guidelineFilePath + widget.guideline + _guidelineFileType;
        _data = Future<YamlMap>(() => rootBundle.loadString(file).then((doc) {
            return loadYaml(doc);
        }))
        ..then((data) =>
            WidgetsBinding.instance.addPostFrameCallback((_) => page.title = data["name"])
        );
    }

    @override
    void dispose() {
        super.dispose();
        _tabController.dispose();
    }

    Widget buildBody() {
        return FutureBuilder(
            future: _data,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(child: TabBarView(
                        children: [
                            GuidelineBody(snapshot.data!, false),
                            GuidelineBody(snapshot.data!, true)
                        ]
                    ));
                } else {
                    return const Expanded(child: CircularProgressIndicator());
                }
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                TabBar(
                    controller: _tabController,
                    tabs: const [
                        Tab(text: "Private"),
                        Tab(text: "Commercial")
                    ],
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0.0001,
                    indicatorColor: Colors.transparent
                ),
                FutureBuilder(
                    future: _data,
                    builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                            return Expanded(child: TabBarView(
                                controller: _tabController,
                                children: [
                                    GuidelineBody(snapshot.data!, false),
                                    GuidelineBody(snapshot.data!, true)
                                ]
                            ));
                        } else {
                            return const Expanded(child: CircularProgressIndicator());
                        }
                    }
                )
            ]
        );
    }
}


class GuidelineBody extends StatelessWidget {
    const GuidelineBody(this.guidelineData, this.showCommercialStandard, { super.key });

    final YamlMap guidelineData;
    final bool showCommercialStandard;

    @override
    Widget build(BuildContext context) {
        final List<Widget> sections = [];
        String standard = showCommercialStandard ? 'commercial' : 'private';
        if ((guidelineData[standard]) == null) {
            // No driving standards
            sections.add(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const SizedBox(height: 20),
                    RichText(
                        text: TextSpan(
                            text: 'There are no $standard driving standards',
                            style: Theme.of(context).textTheme.bodySmall
                        )
                    )
                ]
            ));
        } else {
            sections.add(GuidelineNonDriving(guidelineData[standard]['non_driving_period']));
            sections.add(GuidelineLicence(guidelineData[standard]['unconditional_licence'], GuidelineLicence.unconditional));
            sections.add(GuidelineLicence(guidelineData[standard]['conditional_licence'], GuidelineLicence.conditional));
        }
        sections.add(GuidelineNote(guidelineData['note']));
        return Container(
            padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                left: 20,
                right: 20
            ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: showCommercialStandard ? Theme.of(context).commercialStandardColor : Theme.of(context).privateStandardColor,
                        width: 6
                    )
                )
            ),
            child: ListView(
                children: sections
            )
        );
    }
}
