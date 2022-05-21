import 'package:flutter/material.dart';

class GuidelineNonDriving extends StatelessWidget {
    const GuidelineNonDriving(this.data, { Key? key }): super(key: key);

    final Object? data;

    @override
    Widget build(BuildContext context) {
        Widget heading = RichText(
            text: TextSpan(
                text: 'Non-Driving Period',
                style: Theme.of(context).textTheme.headline2
            )
        );
        List<Widget> body = [];
        if (data == null) {
            // No non-driving period, no special scenarios
            body.add(RichText(
                text: TextSpan(
                    text: 'None',
                    style: Theme.of(context).textTheme.bodyText2
                )
            ));
        } else if (data.runtimeType == String) {
            // Single default non-driving period
            body.add(RichText(
                text: TextSpan(
                    text: data as String,
                    style: Theme.of(context).textTheme.bodyText2
                )
            ));
        } else {
            // List of non driving periods
            List<Widget> durations = [];
            var periods = data as List;
            if (periods.length == 1) {
                String condition = periods[0]['criteria'] ?? '';
                condition = condition.isNotEmpty ? condition + ': ' : condition;
                String duration = periods[0]['duration'] ?? 'None';
                durations.add(const SizedBox(height: 5));
                durations.add(RichText(
                    text: TextSpan(
                        text: condition + duration,
                        style: Theme.of(context).textTheme.bodyText2
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
                            style: Theme.of(context).textTheme.bodyText2
                        )
                    ));
                }
            }
            body.add(Column(
                children: durations,
                crossAxisAlignment: CrossAxisAlignment.start
            ));
        }
        return Column(
            children: [
                const SizedBox(height: 20),
                heading,
                const SizedBox(height: 5),
                ...body
            ],
            crossAxisAlignment: CrossAxisAlignment.start
        );
    }
}
