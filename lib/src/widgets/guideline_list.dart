import 'package:flutter/material.dart';

import 'guideline.dart';
import '../instant_page_route.dart';

class GuidelineList extends StatelessWidget {
    const GuidelineList(Map<String, String> this.routes, { Key? key }): super(key: key);

    final Map<String, String> routes;

    @override
    Widget build(BuildContext context) {
        final List<ListTile> navigation_list = [];
        routes.forEach((k, v) {
            navigation_list.add(ListTile(
                title: Text(v),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Guideline(k)
                    )
                )
            ));
        });
        return Scaffold(
            appBar: AppBar(
                title: const Text('Driving Guidelines'),
                titleTextStyle: Theme.of(context).textTheme.headline1
            ),
            body: Container(
                child: ListView(
                    children: navigation_list
                ),
            ),
            backgroundColor: Colors.white
        );
    }
}
