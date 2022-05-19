import 'package:flutter/material.dart';

class GuidelineHeading extends StatelessWidget {
    const GuidelineHeading(this.data, { Key? key }): super(key: key);

    final String data;

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text(
                data,
                style: Theme.of(context).textTheme.headline2
            ),
        );
    }
}
