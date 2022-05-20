import 'package:flutter/material.dart';

import '../index_data.dart';
import 'guideline.dart';

class Index extends StatefulWidget {
    const Index({ Key? key }): super(key: key);

    static const routeName = '/index';

    @override
    State<Index> createState() => _IndexState();
}


class _IndexState extends State<Index> {
    _IndexState();

    Future<IndexData>? index;

    @override
    void initState() {
        super.initState();
        index = IndexData.load();
    }

    Widget buildPageHeading(BuildContext context) {
        return ListTile(
            title: Text(
                'Guidelines',
                style: Theme.of(context).textTheme.headline2
            ),
            dense: true
        );
    }

    Widget indexBuilder(BuildContext context, AsyncSnapshot<IndexData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
                return const Placeholder();
            } else {
                final List<ListTile> navigationList = [];
                IndexData indexData = snapshot.data!;
                indexData.data.forEach((k, v) {
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
                return Column(
                    children: navigationList,
                    crossAxisAlignment: CrossAxisAlignment.center
                );
            }
        } else {
            return const CircularProgressIndicator();
        }
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: const Text('Driving Guidelines'),
                titleTextStyle: Theme.of(context).textTheme.headline1
            ),
            body: Container(
                child: ListView(
                    children: [
                        buildPageHeading(context),
                        FutureBuilder(
                            future: index,
                            builder: indexBuilder
                        ),
                    ]
                ),
                padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 5,
                    right: 5
                )
            ),
            backgroundColor: Colors.white
        );
    }
}
