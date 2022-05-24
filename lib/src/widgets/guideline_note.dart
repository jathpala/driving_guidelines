/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

class GuidelineNote extends StatelessWidget {
    const GuidelineNote(this.data, { Key? key }): super(key: key);

    final Object? data;

    @override
    Widget build(BuildContext context) {
        List<Widget> content = [];
        if (data != null) {
            var note = data as String;
            Widget heading = RichText(
                text: TextSpan(
                    text: 'Note',
                    style: Theme.of(context).textTheme.headline2
                )
            );
            List<Widget> body = [];
            body.add(RichText(
                text: TextSpan(
                    text: note,
                    style: Theme.of(context).textTheme.bodyText2
                )
            ));
            content = [
                const SizedBox(height: 20),
                heading,
                const SizedBox(height: 5),
                ...body
            ];
        }
        return Column(
            children: content,
            crossAxisAlignment: CrossAxisAlignment.start
        );
    }
}
