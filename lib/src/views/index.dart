/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style.dart';
import '../guideline_window.dart';
import '../models/index_model.dart';
import '../models/preferences_model.dart';
import '../models/window_model.dart';

class Index extends StatefulWidget {
    const Index({ Key? key }): super(key: key);

    static const title = 'Driving Guidelines';

    @override
    State<Index> createState() => _IndexState();
}


class _IndexState extends State<Index> {
    _IndexState();

    List<bool>? _panelIsOpen;

    List<Widget> buildPanelGroup(BuildContext context, PreferencesModel preferences, Map<String, String> guidelines) {
        var sortedKeys = guidelines.keys.toList()..sort();
        List<Widget> navigationList = [];
        for (var id in sortedKeys) {
            navigationList.add(Consumer<WindowModel>(
                builder: (context, view, child) {
                    return ListTile(
                        title: Text(
                            guidelines[id]!,
                            style: Theme.of(context).textTheme.subtitle1
                        ),
                        trailing: IconButton(
                            icon: Icon(
                                preferences.favourites.contains(id) ? Icons.favorite : Icons.favorite_border,
                                color: preferences.favourites.contains(id) ? Colors.red : Theme.of(context).navBarUnselectedColor
                            ),
                            onPressed: () {
                                preferences.toggleFavourite(id);
                            }
                        ),
                        dense: false,
                        onTap: () {
                            Navigator.pushNamed(
                                context,
                                GuidelineWindow.routeName,
                                arguments: {
                                    'guideline': id,
                                    'showCommercialStandard': false
                                }
                            );
                        }
                    );
                }
            ));
        }
        return navigationList;
    }

    List<Widget> buildPanelList(BuildContext context, PreferencesModel preferences, Map<String, Map<String, String>>? sortedGuidelines) {
        List<Widget> navigationList = [];
        var firstGroup = true;
        sortedGuidelines?.forEach((group, guidelines) {
            if (!firstGroup) {
                navigationList.add(Divider());
            }
            navigationList.addAll(buildPanelGroup(context, preferences, guidelines));
            firstGroup = false;
        });
        return navigationList;
    }

    ExpansionPanel buildPanel(BuildContext context, PreferencesModel preferences, int panelNumber, String categoryName, Map<String, Map<String, String>>? sortedGuidelines) {
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
                children: buildPanelList(context, preferences, sortedGuidelines)
            ),
            canTapOnHeader: true,
            isExpanded: _panelIsOpen![panelNumber]
        );
    }

    List<ExpansionPanel> buildPanels(BuildContext context, IndexModel index, PreferencesModel preferences) {
        List<ExpansionPanel> panelList = [];
        var categories = {
            'blackouts': 'Syncope',
            'cardiovascular': 'Cardiovascular',
            'other': 'Other'
        };
        _panelIsOpen ??= List.filled(categories.length, false);
        var i = 0;
        for (var c in categories.keys.toList()) {
            panelList.add(buildPanel(context, preferences, i, categories[c]!, index.sortedGuidelines[c]));
            i++;
        }
        return panelList;
    }

    @override
    Widget build(BuildContext context) {
        return Consumer2<IndexModel, PreferencesModel>(
            builder: (context, index, preferences, child) {
                return SingleChildScrollView(
                    child: ExpansionPanelList(
                        children: buildPanels(context, index, preferences),
                        expansionCallback: (i, isOpen) {
                            setState(() {
                                _panelIsOpen?[i] = !isOpen;
                            });
                        }
                    )
                );
            }
        );
    }
}
