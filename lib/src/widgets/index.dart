import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

    late Future<IndexData> index;
    late Future<SharedPreferences> preferences;
    final List<String> _favourites = [];

    @override
    void initState() {
        super.initState();
        index = IndexData.load();
        preferences = SharedPreferences.getInstance();
        preferences.then((prefs) {
            var favourites = prefs.getStringList('favourites');
            if (favourites != null) {
                _favourites.addAll(favourites);
            }
        });
    }

    bool isFavourite(String id) {
        return _favourites.contains(id);
    }

    Widget indexBuilder(BuildContext context, AsyncSnapshot<IndexData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
                return const Placeholder();
            } else {
                final List<ListTile> navigationList = [];
                var futureData = snapshot.data!;
                var indexData = futureData.data;
                indexData.forEach((k, v) {
                    navigationList.add(ListTile(
                        title: Text(
                            v,
                            style: Theme.of(context).textTheme.subtitle1
                        ),
                        trailing: IconButton(
                            icon: Icon(
                                isFavourite(k) ? Icons.favorite : Icons.favorite_border,
                                color: isFavourite(k) ? Colors.red : null,
                                semanticLabel: isFavourite(k) ? 'Remove from favourites' : 'Add to favourites'
                            ),
                            onPressed: () {
                                setState(() {
                                    if (isFavourite(k)) {
                                        _favourites.remove(k);
                                    } else {
                                        _favourites.add(k);
                                    }
                                });
                                preferences.then((prefs) => prefs.setStringList('favourites', _favourites));
                            }
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
                automaticallyImplyLeading: false,
                leading: null
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
