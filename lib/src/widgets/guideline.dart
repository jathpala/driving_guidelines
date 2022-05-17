import 'package:flutter/material.dart';

import 'package:yaml/yaml.dart';

import 'guideline_section.dart';
import '../yaml.dart';


class Guideline extends StatefulWidget {
    const Guideline(this.guideline, { Key? key }): super(key: key);

    final String guideline;

    @override
    State<Guideline> createState() => _GuidelineState(guideline);
}


class _GuidelineState extends State<Guideline> {
    _GuidelineState(this.guideline) {
        loadYAML(guideline).then((result) => setState(() {
            // Parse the main page heading (required)
            mainHeading = result['name'];

            // Parse all sections
            result.forEach((k, v) => sections.add(GuidelineSection(
                section: k,
                contents: v
            )));
        }));
    }

    final String guideline;

    String mainHeading = 'Guideline Name';
    List<Widget> sections = [];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Driving Guidelines'),
                titleTextStyle: Theme.of(context).textTheme.headline1
            ),
            body: Container(
                child: ListView(
                    children: [
                        Container(
                            child: Text(
                                mainHeading,
                                style: Theme.of(context).textTheme.headline2
                            ),
                            margin: EdgeInsets.only(bottom: 25)
                        ),
                        ...sections
                    ]
                ),
                padding: EdgeInsets.all(16)
            ),
            backgroundColor: Colors.white
        );
    }
}
