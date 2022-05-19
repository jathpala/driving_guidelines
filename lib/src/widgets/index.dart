import 'package:flutter/material.dart';

import 'guideline.dart';

class Index extends StatelessWidget {
    const Index({ Key? key }): super(key: key);

    static const routeName = '/index';

    final Map<String, String> guidelines = const {
        'coronary_artery_bypass_grafting': 'Coronary Artery Bypass Grafting',
        'percutaneous_coronary_intervention': 'Percutaneous Coronary Intervention'
    };

    Widget buildPageHeading(BuildContext context) {
        return ListTile(
            title: Text('Guidelines', style: Theme.of(context).textTheme.headline2),
            dense: true
        );
    }

    Widget buildGuidelineList(BuildContext context) {
        final List<ListTile> navigationList = [];
        guidelines.forEach((k, v) {
            navigationList.add(ListTile(
                title: Text(v, style: Theme.of(context).textTheme.headline4),
                dense: true,
                onTap: () {
                    Navigator.pushNamed(
                        context,
                        Guideline.routeName,
                        arguments: k
                    );
                }
            ));
        });
        return Column(children: navigationList);
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: const Text('Driving Guidelines'),
                titleTextStyle: Theme.of(context).textTheme.headline1
            ),
            body: ListView(
                children: [
                    buildPageHeading(context),
                    buildGuidelineList(context)
                ]
            ),
            backgroundColor: Colors.white
        );
    }
}
