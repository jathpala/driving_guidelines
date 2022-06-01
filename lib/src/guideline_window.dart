/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'style.dart';
import 'models/guideline_model.dart';
import 'models/preferences_model.dart';
import 'views/components/main_app_bar.dart';
import 'views/components/main_nav_bar.dart';

import 'widgets/guideline.dart';

class GuidelineWindow extends StatefulWidget {
    const GuidelineWindow(this.id, { Key? key }): super(key: key);

    static const routeName = '/guideline';

    final String id;

    @override
    State<GuidelineWindow> createState() => _GuidelineWindowState();
}


class _GuidelineWindowState extends State<GuidelineWindow> {
    _GuidelineWindowState();

    Widget buildTabBar(BuildContext context) {
        return Container(
            child: SizedBox(
                child: TabBar(
                    tabs: [
                        Tab(text: 'Private'),
                        Tab(text: 'Commercial')
                    ],
                    // Effectively hide the indicator
                    indicatorWeight: 0.001,
                    indicatorColor: Theme.of(context).navBarColor
                ),
                height: kToolbarHeight
            ),
            color: Theme.of(context).navBarColor
        );
    }

    Widget buildBody(BuildContext context, GuidelineModel guideline) {
        return Expanded(child: TabBarView(
            children: [
                Guideline(guideline, false),
                Guideline(guideline, true)
            ]
        ));
    }

    Widget buildFavouritesButton(BuildContext context) {
        return Consumer<PreferencesModel>(
            builder: (context, preferences, child) {
                return FloatingActionButton(
                    child: preferences.favourites.contains(widget.id) ?
                        Icon(Icons.favorite, color: Colors.red[700]) :
                        Icon(Icons.favorite_border, color: Theme.of(context).navBarUnselectedColor),
                    onPressed: () => preferences.toggleFavourite(widget.id),
                    backgroundColor: Theme.of(context).navBarColor
                );
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (context) => GuidelineModel(widget.id),
            child: Consumer<GuidelineModel>(
                builder: (context, guideline, child) => Scaffold(
                    appBar: MainAppBar(title: guideline.data?['name']),
                    bottomNavigationBar: MainNavBar(GuidelineWindow.routeName),
                    floatingActionButton: buildFavouritesButton(context),
                    body: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                buildTabBar(context),
                                buildBody(context, guideline)
                            ]
                        )
                    )
                )
            )
        );
    }
}


/*            Expanded(
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
*/



/*


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
        return ChangeNotifierProvider(
            create: (context) => GuidelineModel(),
            child: Scaffold(
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
                body:
                )
            )
        );
    }
}
*/
