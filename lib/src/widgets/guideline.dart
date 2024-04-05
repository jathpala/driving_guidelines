/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:yaml/yaml.dart";

import '../style.dart';

import 'guideline_licence.dart';
import 'guideline_non_driving.dart';
import 'guideline_note.dart';


class Guideline extends StatelessWidget {
    const Guideline(this.guidelineData, this.showCommercialStandard, { Key? key }): super(key: key);

    final YamlMap guidelineData;
    final bool showCommercialStandard;

    @override
    Widget build(BuildContext context) {
        final List<Widget> sections = [];
        String standard = showCommercialStandard ? 'commercial' : 'private';
        if ((guidelineData[standard]) == null) {
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
            sections.add(GuidelineNonDriving(guidelineData[standard]['non_driving_period']));
            sections.add(GuidelineLicence(guidelineData[standard]['unconditional_licence'], GuidelineLicence.unconditional));
            sections.add(GuidelineLicence(guidelineData[standard]['conditional_licence'], GuidelineLicence.conditional));
        }
        sections.add(GuidelineNote(guidelineData['note']));
        return Container(
            child: ListView(
                children: sections
            ),
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
            )
        );
    }
}
