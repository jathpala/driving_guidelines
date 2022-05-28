/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../index_data.dart';
import 'guideline_container.dart';
import 'navigation.dart';
import 'options_menu.dart';


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
    List<String> _favourites = [];
    List<bool>? _panelIsOpen;

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

    List<ListTile> buildGroup(dynamic guidelines) {
        List<ListTile> navigationList = [];
        var guidelineList = guidelines.keys.toList()..sort();
        for (var guideline in guidelineList) {
            navigationList.add(ListTile(
                title: Text(
                    guidelines[guideline],
                    style: Theme.of(context).textTheme.subtitle1
                ),
                trailing: IconButton(
                    icon: Icon(
                        isFavourite(guideline) ? Icons.favorite : Icons.favorite_border,
                        color: isFavourite(guideline) ? Colors.red : null,
                        semanticLabel: isFavourite(guideline) ? 'Remove from favourites' : 'Add to favourites'
                    ),
                    onPressed: () {
                        setState(() {
                            if (isFavourite(guideline)) {
                                _favourites.remove(guideline);
                            } else {
                                _favourites.add(guideline);
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
                            'guideline': guideline,
                            'showCommercialStandard': false
                        }
                    ).then((_) {
                        preferences.then((prefs) {
                            setState(() {
                                _favourites = prefs.getStringList('favourites') ?? [];
                            });
                        });
                    });
                }
            ));
        }
        return navigationList;
    }

    ExpansionPanel buildCategory(String category, dynamic groups, int i, BuildContext context)  {
        String categoryName = '';
        switch (category) {
            case 'cardiovascular':
                categoryName = 'Cardiovascular';
                break;
            case 'blackouts':
                categoryName = 'Syncope';
                break;
            case 'other':
                categoryName = 'Other';
                break;
            default:
                categoryName = 'Uncategorised';
                break;
        }

        List<Widget> navigationList = [];
        var isFirstGroup = true;
        groups.forEach((k, v) {
            if (isFirstGroup) {
                isFirstGroup = false;
            } else {
                navigationList.add(const Divider());
            }
            navigationList.addAll(buildGroup(v));
        });
        return ExpansionPanel(
            headerBuilder: (context, isOpen) {
                return Container(
                    child: Text(
                        categoryName,
                        style: Theme.of(context).textTheme.headline3
                    ),
                    padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 20,
                        right: 20
                    )
                );
            },
            body: Column(
                children: navigationList
            ),
            isExpanded: _panelIsOpen![i]
        );
    }

    Widget indexBuilder(BuildContext context, AsyncSnapshot<IndexData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
                return const Placeholder();
            } else {
                var futureData = snapshot.data!;
                var indexData = futureData.data;
                List<ExpansionPanel> navigationList = [];
                _panelIsOpen ??= List.filled(indexData.length, false);
                const categories = ['blackouts', 'cardiovascular', 'other'];
                var i = 0;
                for (var category in categories) {
                    navigationList.add(buildCategory(category, indexData[category], i, context));
                    i++;
                }

                return SingleChildScrollView(child: ExpansionPanelList(
                    children: navigationList,
                    expansionCallback: (i, isOpen) {
                        setState(() {
                            _panelIsOpen?[i] = !isOpen;
                        });
                    }
                ));
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
                leading: null,
                actions: const [OptionsMenu()]
            ),
            bottomNavigationBar: const Navigation(Index.routeName),
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
