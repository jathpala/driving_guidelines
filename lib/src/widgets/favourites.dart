import 'package:flutter/material.dart';

import '../style.dart';
import 'index.dart';
import 'navigation.dart';

class Favourites extends StatelessWidget {
    const Favourites({ Key? key }): super(key: key);

    static const routeName = '/favourites';

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
                    title: Text('Favourites'),
                    leadingWidth: Theme.of(context).appBarTheme.leadingWidth
                ),
                bottomNavigationBar: Navigation(Favourites.routeName),
                body: Placeholder()
            )
        );
    }
}
