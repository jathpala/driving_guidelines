/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import '../about_dialog.dart';
import '../style.dart';

class OptionsMenu extends StatelessWidget {
    const OptionsMenu({ Key? key }): super(key: key);

    @override
    Widget build(BuildContext context) {
        return PopupMenuButton(
            itemBuilder: (context) {
                return [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Text(
                            'About',
                            style: Theme.of(context).textTheme.smallText1
                        ),
                    )
                ];
            },
            onSelected: (value) {
                switch (value) {
                    case 0:
                        showApplicationAboutDialog(context);
                        break;
                }
            }
        );
    }
}
