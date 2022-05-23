import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../index_data.dart';
import 'guideline_container.dart';
import 'index.dart';
import 'navigation.dart';


class Favourites extends StatefulWidget {
    const Favourites({ Key? key }): super(key: key);

    static const routeName = '/favourites';

    @override
    State<Favourites> createState() => _FavouritesState();
}


class _FavouritesState extends State<Favourites> {
    _FavouritesState();

    final _mainTitle = 'Favourites';

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
                    if (_favourites.contains(k)) {
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
                                    GuidelineContainer.routeName,
                                    arguments: {
                                        'guideline': k,
                                        'showCommercialStandard': false
                                    }
                                );
                            }
                        ));
                    }
                });
                return ListView(children: navigationList);
            }
        } else {
            return const CircularProgressIndicator();
        }
    }

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
            child:Scaffold(
                appBar: AppBar(
                    title: Text(_mainTitle),
                    automaticallyImplyLeading: false,
                    leading: null
                ),
                bottomNavigationBar: const Navigation(Favourites.routeName),
                body: Container(
                    child: FutureBuilder(
                        future: index,
                        builder: indexBuilder
                    ),
                    padding: const EdgeInsets.only(
                        top: 10,
                    )
                )
            )
        );
    }
}
