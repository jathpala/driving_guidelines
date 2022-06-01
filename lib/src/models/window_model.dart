/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../views/index.dart';
//import 'views/navigation.dart';



/// Allows child widgets to control elements of the main window
/// Used by the app bar and the nav bar
class WindowModel extends ChangeNotifier {
    WindowModel() {
        setIndex(0);
    }

    /// Index of the view to be shown in the main window
    /// 0 = Index
    /// 1 = Favourites
    /// 2 = Information
    int index = 0;

    /// Title to be displayed in the app bar
    String title = '';

    /// View to be displayed in the main window
    Widget mainWindowBody = Placeholder();

    void setIndex(index) {
        this.index = index;

        switch (index) {
            case 0:
                title = 'Driving Guidelines';
                mainWindowBody = Index();
                break;
            //case 1:
            //    view = Favourites();
            //    break;
            //case 2:
            //    view = Information();
            //    break;
            default:
                mainWindowBody = Placeholder();
                break;
        }

        // Inform dependent widgets to update
        notifyListeners();
    }

}
