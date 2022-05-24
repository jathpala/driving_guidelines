/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).


// TODO: Not currently used in any view - consider removing once design is
// finalised.

import 'package:flutter/material.dart';

class GuidelineHeading extends StatelessWidget {
    const GuidelineHeading(this.data, { Key? key }): super(key: key);

    final String data;

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text(
                data,
                style: Theme.of(context).textTheme.headline1
            ),
            padding: const EdgeInsets.only(top: 5)
        );
    }
}
