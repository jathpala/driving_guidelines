import 'package:flutter/material.dart';

import '../guideline_data.dart';
import 'guideline_heading.dart';
import 'guideline_non_driving.dart';
import 'guideline_licence.dart';
import 'guideline_note.dart';
import 'guideline_floating_buttons.dart';

class Guideline extends StatefulWidget {
    const Guideline(this.id, { Key? key }): super(key: key);

    static const routeName = '/guideline';
    final String id;

    static _GuidelineState? of(BuildContext context) =>
        context.findAncestorStateOfType<_GuidelineState>();

    @override
    State<Guideline> createState() => _GuidelineState();
}


class _GuidelineState extends State<Guideline> {
    _GuidelineState();

    Future<GuidelineData>? guideline;
    bool isCommercial = false;

    void toggleStandard(bool isCommercial) {
        setState(() {
            this.isCommercial = isCommercial;
        });
    }

    @override
    void initState() {
        super.initState();
        guideline = GuidelineData.load(widget.id);
    }

    Widget guidelineBuilder(BuildContext context, AsyncSnapshot<GuidelineData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
                return const Placeholder();
            } else {
                final List<Widget> sections = [];
                String standard = isCommercial ? 'commercial' : 'private';
                GuidelineData guidelineData = snapshot.data!;
                sections.add(GuidelineHeading(guidelineData.data['name']));
                if ((guidelineData.data[standard]) == null) {
                    // No driving standards
                    sections.add(Column(
                        children: [
                            const SizedBox(height: 20),
                            RichText(
                                text: TextSpan(
                                    text: 'There are no $standard driving standards',
                                    style: Theme.of(context).textTheme.subtitle1
                                )
                            )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start
                    ));
                } else {
                    sections.add(GuidelineNonDriving(guidelineData.data[standard]['non_driving_period']));
                    sections.add(GuidelineLicence(guidelineData.data[standard]['unconditional_licence'], GuidelineLicence.unconditional));
                    sections.add(GuidelineLicence(guidelineData.data[standard]['conditional_licence'], GuidelineLicence.conditional));
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
            return const CircularProgressIndicator();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Driving Guidelines'),
                titleTextStyle: Theme.of(context).textTheme.headline1
            ),
            body: Stack(
                children: [
                    FutureBuilder(
                        future: guideline,
                        builder: guidelineBuilder
                    ),
                    GuidelineFloatingButtons(isCommercial)
                ]
            )
        );
    }
}
