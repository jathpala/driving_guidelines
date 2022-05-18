import 'package:flutter/material.dart';

import 'package:yaml/yaml.dart';

import 'guideline_section.dart';
import '../yaml.dart';


class Guideline extends StatefulWidget {
    const Guideline(String this.guideline, { Key? key }): super(key: key);

    static const routeName = '/guideline';
    final String guideline;

    @override
    State<Guideline> createState() => _GuidelineState(guideline);
}


class _GuidelineState extends State<Guideline> {
    _GuidelineState(String this.guideline);

    final String guideline;

    String mainHeading = '';
    List<Widget> sections = [];

    List<Widget> buildHeading(String heading, BuildContext context) {
        final content = <Widget>[];
        content.add(Text(
            heading,
            style: Theme.of(context).textTheme.headline3
        ));
        content.add(SizedBox(height: 5));
        return content;
    }

    List<Widget> buildSimpleBody(String text, BuildContext context) {
        final content = <Widget>[];
        content.add(RichText(
            text: TextSpan(
                text: text,
                style: Theme.of(context).textTheme.bodyText1
            )
        ));
        content.add(SizedBox(height: 20));
        return content;
    }

    List<Widget> buildConditionsBody(BuildContext context, { String? review, List<String>? criteria }) {
        final content = <Widget>[];
        content.add(RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                // FIXME: children should be build conditionally based on whether
                // review or criteria are present.
                children: <TextSpan>[
                    TextSpan(text: 'Allowed', style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(text: ', subject to '),
                    TextSpan(text: '${review} review', style: Theme.of(context).textTheme.bodyText1),
                    TextSpan(text: ' and where the following criteria are met:')
                ]
            )
        ));
        content.add(SizedBox(height: 10));
        criteria?.forEach((c) {
            content.add(RichText(
                text: TextSpan(
                    text: ' \u2022   ' + c,
                    style: Theme.of(context).textTheme.bodyText1
                )
            ));
            content.add(SizedBox(height: 10));
        });
        content.add(SizedBox(height: 10));
        return content;
    }

    void parseGuideline(context) {
        loadYAML(guideline).then((result) => setState(() {
            // Parse the main page heading (required)
            mainHeading = result['name'];

            // Parse all sections
            result.forEach((section, yaml) {
                List<Widget> content = <Widget>[];
                switch (section) {
                    case 'non_driving_period':
                        content += buildHeading('Non-Driving Period', context);
                        content += buildSimpleBody((yaml as YamlMap)['duration'], context);
                        break;
                    case 'unconditional_licence':
                        content += buildHeading('Unconditional Licence', context);
                        content += (yaml as YamlMap)['allowed'] ?
                            buildSimpleBody('Allowed', context) :
                            buildSimpleBody('Not allowed', context);
                        break;
                    case 'conditional_licence':
                        content += buildHeading('Conditional Licence', context);
                        if ((yaml as YamlMap)['allowed']) {
                            content += buildConditionsBody(context,
                                review: (yaml as YamlMap)['review'],
                                criteria: [...(yaml as YamlMap)['criteria']],
                            );
                        } else {
                            content += buildSimpleBody('Not allowed', context);
                        }
                        break;
                    case 'note':
                        content += buildHeading('Notes', context);
                        content += buildSimpleBody(yaml as String, context);
                        break;
                }
                sections.addAll(content);
            });
        }));
    }

    @override
    void initState() {
        super.initState();
        // This allows context to be available in parseGuideline
        Future.delayed(Duration.zero).then((_) => parseGuideline(context));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Driving Guidelines'),
                titleTextStyle: Theme.of(context).textTheme.headline1
            ),
            body: ListView(
                children: [
                    Text(
                        mainHeading,
                        style: Theme.of(context).textTheme.headline2
                    ),
                    SizedBox(height: 10),
                    ...sections
                ],
                padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 20
                )
            ),
        );
    }
}
