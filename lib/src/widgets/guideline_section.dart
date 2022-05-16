import 'package:flutter/material.dart';

import 'package:yaml/yaml.dart';

class GuidelineSection extends StatelessWidget {
    const GuidelineSection({ Key? key, required this.section, required this.contents }): super(key: key);

    final String section;
    final Object contents;

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
        content.add(SizedBox(height: 20));
        return content;
    }

    @override
    Widget build(BuildContext context) {
        List<Widget> content = <Widget>[];
        bool recognised_section = true;
        switch (section) {
            case 'non_driving_period':
                content += buildHeading('Non-Driving Period', context);
                content += buildSimpleBody((contents as YamlMap)['duration'], context);
                break;
            case 'unconditional_licence':
                content += buildHeading('Unconditional Licence', context);
                content += (contents as YamlMap)['allowed'] ?
                    buildSimpleBody('Allowed', context) :
                    buildSimpleBody('Not allowed', context);
                break;
            case 'conditional_licence':
                content += buildHeading('Conditional Licence', context);
                if ((contents as YamlMap)['allowed']) {
                    content += buildConditionsBody(context,
                        review: (contents as YamlMap)['review'],
                        criteria: [...(contents as YamlMap)['criteria']],
                    );
                } else {
                    content += buildSimpleBody('Not allowed', context);
                }
                break;
            case 'note':
                content += buildHeading('Notes', context);
                content += buildSimpleBody(contents as String, context);
                break;
            default:
                recognised_section = false;
                break;
        }
        if (recognised_section) {
            return Column(
                children: content,
                crossAxisAlignment: CrossAxisAlignment.start
            );
        } else {
            return SizedBox.shrink();
        }
    }
}
