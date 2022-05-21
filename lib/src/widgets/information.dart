import 'package:flutter/material.dart';

import '../style.dart';
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
                    title: Text('Information'),
                    leadingWidth: Theme.of(context).appBarTheme.leadingWidth
                ),
                bottomNavigationBar: Navigation(Information.routeName),
                body: Placeholder()
            )
        );
    }
}
