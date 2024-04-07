// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:yaml/yaml.dart';

class GuidelineLicence extends StatelessWidget {
    const GuidelineLicence(this.data, this.typeIsUnconditional, { super.key });

    static const unconditional = true;
    static const conditional = false;

    final bool typeIsUnconditional;
    final Object? data;

    @override
    Widget build(BuildContext context) {
        Widget heading = RichText(
            text: TextSpan(
                text: typeIsUnconditional ? 'Unconditional Licence' : 'Conditional Licence',
                style: Theme.of(context).textTheme.bodyLarge
            )
        );
        List<Widget> body = [];
        if (data == null) {
            // Licence not allowed
            body.add(RichText(
                text: TextSpan(
                    text: 'Not allowed',
                    style: Theme.of(context).textTheme.bodyMedium
                )
            ));
        } else if (data.runtimeType == bool) {
            // Single boolean value without any details
            body.add(RichText(
                text: TextSpan(
                    text: (data as bool) ? 'Allowed' : 'Not allowed',
                    style: Theme.of(context).textTheme.bodyMedium
                )
            ));
        } else {
            // Map of detailed conditions
            var conditions = data as YamlMap;
            String sentence = '';
            sentence += (conditions['allowed'] as bool) ? 'Allowed' : 'Not allowed';
            if (conditions['review'] != null) {
                sentence += ' subject to ${conditions["review"]} review';
                if (conditions['reviewer'] != null) {
                    sentence += ' by ${conditions["reviewer"]}';
                }
            }
            if (conditions['criteria'] != null) {
                sentence += conditions['review'] != null ? ', and' : '';
                sentence += ' where the following criteria are met:';
            }
            body.add(RichText(
                text: TextSpan(
                    text: sentence,
                    style: Theme.of(context).textTheme.bodyMedium
                )
            ));
            if (conditions['criteria'] != null) {
                // Loop over the list of criteria
                conditions['criteria'].forEach((criterion) {
                    body.add(const SizedBox(height: 2.5));
                    body.add(RichText(
                        text: TextSpan(
                            text: " \u2022  $criterion",
                            style: Theme.of(context).textTheme.bodyMedium
                        )
                    ));
                });
            }
        }
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const SizedBox(height: 20),
                heading,
                const SizedBox(height: 5),
                ...body
            ],
        );
    }
}
