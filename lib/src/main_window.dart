/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'index_data.dart';
import 'views/index.dart';
//import 'views/navigation.dart';
import 'views/components/main_nav_bar.dart';
import 'views/components/main_app_bar.dart';

class MainWindow extends StatefulWidget {
    const MainWindow({ Key? key }): super(key: key);

    /// Route name for navigation
    static const routeName = '/';

    @override
    State<MainWindow> createState() => _MainWindowState();
}


class _MainWindowState extends State<MainWindow> {
    _MainWindowState();

    //late Future<IndexData> index;
    //late Future<SharedPreferences> preferences;

    /*@override
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
    }*/

    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (context) => MainWindowViewModel(),
            child: Scaffold(
                appBar: MainAppBar(),
                bottomNavigationBar: MainNavBar(),
                body: Consumer<MainWindowViewModel>(
                    builder: (context, view, child) => view.body
                )
            )
        );
    }
}


/// Allows child widgets to control elements of the main window
/// Used by the app bar and the nav bar
class MainWindowViewModel extends ChangeNotifier {
    MainWindowViewModel() {
        setIndex(0);
    }

    /// Index of the view to be shown in the main window
    /// 0 = Index
    /// 1 = Favourites
    /// 2 = Information
    var _index = 0;
    int get index => _index;

    /// Title to be displayed in the app bar
    var _title = '';
    String get title => _title;

    /// View to be displayed in the main window
    Widget _body = Placeholder();
    Widget get body => _body;

    void setIndex(index) {
        _index = index;

        switch (index) {
            case 0:
                _title = 'Driving Guidelines';
                _body = Index();
                break;
            //case 1:
            //    view = Favourites();
            //    break;
            //case 2:
            //    view = Information();
            //    break;
            default:
                _body = Placeholder();
                break;
        }

        // Inform dependent widgets to update
        notifyListeners();
    }

}
