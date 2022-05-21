import 'package:flutter/material.dart';

import '../index_data.dart';
import '../style.dart';
import 'guideline.dart';
import 'navigation.dart';


class Index extends StatefulWidget {
    const Index({ Key? key }): super(key: key);

    static const routeName = '/index';

    @override
    State<Index> createState() => _IndexState();
}


class _IndexState extends State<Index> {
    _IndexState();

    final _mainTitle = 'Driving Guidelines';

    Future<IndexData>? index;

    @override
    void initState() {
        super.initState();
        index = IndexData.load();
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
                        title: Text(
                            v,
                            style: Theme.of(context).textTheme.subtitle1
                        ),
                        dense: false,
                        onTap: () {
                            Navigator.pushNamed(
                                context,
                                Guideline.routeName,
                                arguments: k
                            );
                        }
                    ));
                });
                return ListView(children: navigationList);
            }
        } else {
            return const CircularProgressIndicator();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(_mainTitle),
                leadingWidth: Theme.of(context).appBarTheme.leadingWidth
            ),
            bottomNavigationBar: Navigation(Index.routeName),
            body: Container(
                child: FutureBuilder(
                    future: index,
                    builder: indexBuilder
                ),
                padding: const EdgeInsets.only(
                    top: 10,
                )
            ),
        );
    }
}
