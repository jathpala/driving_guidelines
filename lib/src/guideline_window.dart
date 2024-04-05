/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'style.dart';
import '../models/preferences_model.dart';
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

    // Widget buildTabBar(BuildContext context) {
    //     return Container(
    //         child: SizedBox(
    //             child: TabBar(
    //                 tabs: const [
    //                     Tab(text: 'Private'),
    //                     Tab(text: 'Commercial')
    //                 ],
    //                 // Effectively hide the indicator
    //                 indicatorWeight: 0.001,
    //                 indicatorColor: Theme.of(context).navBarColor
    //             ),
    //             height: kToolbarHeight
    //         ),
    //         color: Theme.of(context).navBarColor
    //     );
    // }

    // Widget buildBody(BuildContext context, GuidelineModel guideline) {
    //     return Expanded(child: TabBarView(
    //         children: [
    //             Guideline(guideline, false),
    //             Guideline(guideline, true)
    //         ]
    //     ));
    // }

    // Widget buildFavouritesButton(BuildContext context) {
    //     return Consumer<PreferencesModel>(
    //         builder: (context, preferences, child) {
    //             return FloatingActionButton(
    //                 child: preferences.favourites.contains(widget.id) ?
    //                     Icon(Icons.favorite, color: Colors.red[700]) :
    //                     Icon(Icons.favorite_border, color: Theme.of(context).navBarUnselectedColor),
    //                 onPressed: () => preferences.toggleFavourite(widget.id),
    //                 backgroundColor: Theme.of(context).navBarColor
    //             );
    //         }
    //     );
    // }

    // @override
    // Widget build(BuildContext context) {
    //     return ChangeNotifierProvider(
    //         create: (context) => GuidelineModel(widget.id),
    //         child: Consumer<GuidelineModel>(
    //             builder: (context, guideline, child) => Scaffold(
    //                 appBar: MainAppBar(title: guideline.data?['name']),
    //                 bottomNavigationBar: const MainNavBar(GuidelineWindow.routeName),
    //                 floatingActionButton: buildFavouritesButton(context),
    //                 body: DefaultTabController(
    //                     length: 2,
    //                     initialIndex: 0,
    //                     child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.stretch,
    //                         children: [
    //                             buildTabBar(context),
    //                             buildBody(context, guideline)
    //                         ]
    //                     )
    //                 )
    //             )
    //         )
    //     );
    // }

    @override
    Widget build(BuildContext context) {
        return Placeholder();
    }

}
