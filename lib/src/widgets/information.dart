/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'index.dart';
import 'navigation.dart';

class Information extends StatelessWidget {
    const Information({ Key? key }): super(key: key);

    static const routeName = '/information';

    @override
    Widget build(BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
                Navigator.pushReplacementNamed(
                    context,
                    Index.routeName
                    );
                    return false;
            },
            child: Scaffold(
                appBar: AppBar(
                    title: const Text('Information'),
                    automaticallyImplyLeading: false,
                    leading: null
                ),
                bottomNavigationBar: const Navigation(Information.routeName),
                body: const Placeholder()
            )
        );
    }
}
