/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'style.dart';

String _legaleseText() {
    var legalese = 'Copyright 2022 Jath Palasubramaniam.';
    legalese += ' All Rights Reserved.';
    legalese += ' Licenced under the GPLv3.';
    return legalese;
}

List<Widget> _bodyText(context) {
    List<Widget> items = [];
    items.add(const SizedBox(height: 10));
    items.add(Text(
        'This app provides a summary of the Australian medical standards for driver licencing and is targeted at healthcare providers. Refer to the full guidelines published by Austroads for details. Please note this app is not associated with or endorsed by Austroads.',
        style: Theme.of(context).textTheme.smallText1,
        textAlign: TextAlign.justify
    ));
    items.add(const SizedBox(height: 20));
    items.add(Text(
        'Jath Palasubramaniam',
        style: Theme.of(context).textTheme.smallText1,
        textAlign: TextAlign.center
    ));
    items.add(const SizedBox(height: 2.5));
    items.add(Text(
        'jathpala@gmail.com',
        style: Theme.of(context).textTheme.smallText1,
        textAlign: TextAlign.center
    ));
    items.add(const SizedBox(height: 2.5));
    items.add(Text(
        'github.com/jathpala/driving_guidelines',
        style: Theme.of(context).textTheme.smallText1,
        textAlign: TextAlign.center
    ));
    items.add(const SizedBox(height: 20));
    items.add(Text(
        'If you notice any errors or have any suggestions please send me an email or create a github issue.',
        style: Theme.of(context).textTheme.smallText1,
        textAlign: TextAlign.justify
    ));
    return items;
}

void showApplicationAboutDialog(BuildContext context) {
    showAboutDialog(
        context: context,
        applicationVersion: 'v0.1',
        applicationLegalese: _legaleseText(),
        children: _bodyText(context)
    );
}
