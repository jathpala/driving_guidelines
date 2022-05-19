import 'package:flutter/material.dart';

import 'package:yaml/yaml.dart';

import '../guideline_data.dart';
import 'guideline_heading.dart';
import 'guideline_non_driving.dart';
import 'guideline_licence.dart';
import 'guideline_note.dart';

class Guideline extends StatefulWidget {
    const Guideline(String this.id, { Key? key }): super(key: key);

    static const routeName = '/guideline';
    final String id;

    @override
    State<Guideline> createState() => _GuidelineState(id);
}


class _GuidelineState extends State<Guideline> {
    _GuidelineState(String this.id);

    final String id;

    Future<GuidelineData>? guideline;
    bool isPrivate = false;

    @override
    void initState() {
        super.initState();
        this.guideline = GuidelineData.load(id);
    }

    Widget guidelineBuilder(BuildContext context, AsyncSnapshot<GuidelineData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
                return Placeholder();
            } else {
                final List<Widget> sections = [];
                String standard = isPrivate ? 'private' : 'commercial';
                GuidelineData guidelineData = snapshot.data!;
                sections.add(GuidelineHeading(guidelineData.data['name']));
                if ((guidelineData.data[standard]) == null) {
                    // No driving standards
                    sections.add(Column(
                        children: [
                            SizedBox(height: 20),
                            RichText(
                                text: TextSpan(
                                    text: 'There are no ${standard} driving standards',
                                    style: Theme.of(context).textTheme.subtitle1
                                )
                            )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start
                    ));
                } else {
                    sections.add(GuidelineNonDriving(guidelineData.data[standard]['non_driving_period']));
                    sections.add(GuidelineLicence(guidelineData.data[standard]['unconditional_licence'], GuidelineLicence.Unconditional));
                    sections.add(GuidelineLicence(guidelineData.data[standard]['conditional_licence'], GuidelineLicence.Conditional));
                }
                sections.add(GuidelineNote(guidelineData.data['note']));
                return Container(
                    child: ListView(
                        children: sections
                    ),
                    padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 20,
                        right: 20
                    )
                );
            }
        } else {
            return CircularProgressIndicator();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Driving Guidelines'),
                titleTextStyle: Theme.of(context).textTheme.headline1
            ),
            body: FutureBuilder(
                future: guideline,
                builder: guidelineBuilder
            )
        );
    }
}
