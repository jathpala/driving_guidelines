/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../guideline_data.dart';
import '../style.dart';

import 'favourite_button.dart';
import 'guideline.dart';
import 'navigation.dart';
import 'options_menu.dart';

class GuidelineContainer extends StatefulWidget {
    const GuidelineContainer(this.id, this.showCommercialStandard, { Key? key }): super(key: key);

    static const routeName = '/guideline';
    final String id;
    final bool showCommercialStandard;

    static _GuidelineContainerState? of(BuildContext context) =>
        context.findAncestorStateOfType<_GuidelineContainerState>();

    @override
    State<GuidelineContainer> createState() => _GuidelineContainerState();
}


class _GuidelineContainerState extends State<GuidelineContainer> {
    _GuidelineContainerState();

    Future<GuidelineData>? guideline;
    late Future<SharedPreferences> preferences;
    bool _isFavourite = false;

    @override
    void initState() {
        super.initState();
        guideline = GuidelineData.load(widget.id);
        preferences = SharedPreferences.getInstance();
        preferences.then((prefs) {
            var favourites = prefs.getStringList('favourites');
            if (favourites?.contains(widget.id) ?? false) {
                setState(() {
                    _isFavourite = true;
                });
            }
        });
    }

    void toggleFavourite(bool isFavourite) {
        preferences.then((prefs) {
            var favourites = prefs.getStringList('favourites') ?? [];
            if (isFavourite) {
                favourites.add(widget.id);
            } else {
                favourites.remove(widget.id);
            }
            prefs.setStringList('favourites', favourites);
            setState(() {
                _isFavourite = isFavourite;
            });
        });
    }

    Widget headingBuilder(BuildContext context, AsyncSnapshot<GuidelineData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
                return const Placeholder();
            } else {
                GuidelineData guidelineData = snapshot.data!;
                return SingleChildScrollView(
                    child: Text(guidelineData.data['name']),
                    scrollDirection: Axis.horizontal
                );
            }
        } else {
            return const Text('Loading...');
        }
    }

    Widget privateGuidelineBuilder(BuildContext context, AsyncSnapshot<GuidelineData> snapshot) {
        return guidelineBuilder(false, context, snapshot);
    }

    Widget commercialGuidelineBuilder(BuildContext context, AsyncSnapshot<GuidelineData> snapshot) {
        return guidelineBuilder(true, context, snapshot);
    }

    Widget guidelineBuilder(bool showCommercialStandard, BuildContext context, AsyncSnapshot<GuidelineData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
                return const Placeholder();
            } else {
                GuidelineData guidelineData = snapshot.data!;
                return Guideline(guidelineData, showCommercialStandard);
            }
        } else {
            return const CircularProgressIndicator();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: FutureBuilder(
                    future: guideline,
                    builder: headingBuilder
                ),
                automaticallyImplyLeading: false,
                leading: null,
                actions: [
                    Transform.scale(
                        child: FavouriteButton(_isFavourite),
                        scale: 1.2
                    ),
                    const OptionsMenu()
                ]
            ),
            bottomNavigationBar: const Navigation(GuidelineContainer.routeName),
            body: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Container(
                            child: TabBar(
                                tabs: const [
                                    Tab(text: 'Private'),
                                    Tab(text:'Commercial')
                                ],
                                // Effectively hide the indicator
                                indicatorWeight: 0.001,
                                indicatorColor: Theme.of(context).navBarColor
                            ),
                            color: Theme.of(context).navBarColor
                        ),
                        Expanded(
                            // For now this stack isn't really used for anything
                            // It is here to allow FloatingGuidelineButtons
                            child: Stack(
                                children: [
                                    TabBarView(
                                        children: [
                                            FutureBuilder(
                                                future: guideline,
                                                builder: privateGuidelineBuilder
                                            ),
                                            FutureBuilder(
                                                future: guideline,
                                                builder: commercialGuidelineBuilder
                                            )
                                        ]
                                    ),
                                ]
                            )
                        )
                    ]
                )
            )
        );
    }
}
