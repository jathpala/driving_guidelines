// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../models/index_model.dart";
import "../models/preferences_model.dart";
import "../models/page_model.dart";

import "guideline.dart";

class IndexPage extends StatefulWidget {
    const IndexPage({ super.key });

    static const id = "index";
    final title = "Driving Guidelines";

    @override
    State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
    _IndexPageState();

    @override
    void initState() {
        super.initState();
        final page = context.read<PageModel>();
        WidgetsBinding.instance.addPostFrameCallback((_) => page.title = widget.title);
    }

    Widget buildPanelContents(IndexCategory category, PreferencesModel preferences, PageModel page) {
        List<Widget> panelContents = [];
        bool firstGroup = true;
        for (IndexGroup group in category.groups) {
            if (!firstGroup) {
                panelContents.add(Container(
                    color: Theme.of(context).colorScheme.background,
                    child: const Divider()
                ));
            }
            panelContents.addAll(group.items.map<ListTile>((IndexItem item) => ListTile(
                title: Text(item.name),
                trailing: IconButton(
                    icon: Icon(
                        preferences.favourites.contains(item.id) ? Icons.favorite : Icons.favorite_border,
                        color: preferences.favourites.contains(item.id) ? Colors.red[600]! : Colors.grey[400]!
                    ),
                    onPressed: () => preferences.toggleFavourite(item.id)
                ),
                tileColor: Theme.of(context).colorScheme.background,
                contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                minVerticalPadding: 0.0,
                onTap: () {
                    page.setActivePage(GuidelinePage.id, arguments: { "guideline": item.id });
                }
            )));
            firstGroup = false;
        }
        return Column(children: panelContents);
    }

    @override
    Widget build(BuildContext context) {
        return SingleChildScrollView(
            child: Consumer3<IndexModel, PreferencesModel, PageModel>(
                builder: (context, index, preferences, page, child) {
                    return ExpansionPanelList(
                        materialGapSize: 8.0,
                        expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 4.0),
                        children: index.categorisedIndex?.categories.map<ExpansionPanel>((IndexCategory category) {
                            return ExpansionPanel(
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                        title: Text(category.name),
                                        titleTextStyle: Theme.of(context).textTheme.titleMedium,
                                    );
                                },
                                body: buildPanelContents(category, preferences, page),
                                isExpanded: category.isExpanded,
                                canTapOnHeader: true,
                                backgroundColor: category.isExpanded ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.background
                            );
                        }).toList() ?? [ExpansionPanel(
                            headerBuilder: (BuildContext context, bool isExpanded) {
                                return const ListTile(
                                    title: Text("Not found")
                                );
                            },
                            body: const ListTile(title: Text("Not found")),
                            isExpanded: false
                        )],
                        expansionCallback: (i, isExpanded) {
                            setState(() {
                                index.categorisedIndex?.categories[i].isExpanded = isExpanded;
                            });
                        }
                    );
                }
            )
        );
    }
}
