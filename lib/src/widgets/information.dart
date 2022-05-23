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
