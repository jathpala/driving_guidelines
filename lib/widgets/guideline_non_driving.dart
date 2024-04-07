// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

class GuidelineNonDriving extends StatelessWidget {
    const GuidelineNonDriving(this.data, { super.key });

    final Object? data;

    @override
    Widget build(BuildContext context) {
        Widget heading = RichText(
            text: TextSpan(
                text: 'Non-Driving Period',
                style: Theme.of(context).textTheme.bodyLarge
            )
        );
        List<Widget> body = [];
        if (data == null) {
            // No non-driving period, no special scenarios
            body.add(RichText(
                text: TextSpan(
                    text: 'None',
                    style: Theme.of(context).textTheme.bodyMedium
                )
            ));
        } else if (data.runtimeType == String) {
            // Single default non-driving period
            body.add(RichText(
                text: TextSpan(
                    text: data as String,
                    style: Theme.of(context).textTheme.bodyMedium
                )
            ));
        } else {
            // List of non driving periods
            List<Widget> durations = [];
            var periods = data as List;
            if (periods.length == 1) {
                String condition = periods[0]['criteria'] ?? '';
                condition = condition.isNotEmpty ? "$condition: " : condition;
                String duration = periods[0]['duration'] ?? 'None';
                durations.add(const SizedBox(height: 5));
                durations.add(RichText(
                    text: TextSpan(
                        text: condition + duration,
                        style: Theme.of(context).textTheme.bodyMedium
                    )
                ));
            } else {
                for (var period in periods) {
                    String condition = (period['criteria'] ?? 'Generally') + ': ';
                    String duration = period['duration'] ?? 'None';
                    durations.add(const SizedBox(height: 5));
                    durations.add(RichText(
                        text: TextSpan(
                            text: condition + duration,
                            style: Theme.of(context).textTheme.bodyMedium
                        )
                    ));
                }
            }
            body.add(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: durations
            ));
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
