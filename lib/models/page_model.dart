// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";

import "../views/index.dart";
import "../views/favourites.dart";
import "../views/information.dart";
import "../views/guideline.dart";
import "../components/favourite_fab.dart";


class PageModel extends ChangeNotifier {
    PageModel() {
        setActivePage(IndexPage.id);
    }

    // Index for the navigation bar widget
    // 0 = Index
    // 1 = Favourites
    // 2 = Information
    // null = Another page
    int index = 0;

    bool isPrimaryPage = true;

    String? guideline;

    // Title to be displayed in the app bar
    String _title = "";
    String get title => _title;
    set title(String value) {
        _title = value;
        notifyListeners();
    }

    // View to be displayed in the main window
    Widget page = const Placeholder();

    Widget? fab;

    void setActivePage(String pageId, { Map<String, dynamic>? arguments }) {
        switch (pageId) {
            case IndexPage.id:
                index = 0;
                isPrimaryPage = true;
                guideline = null;
                page = const IndexPage();
                fab = null;
            case FavouritesPage.id:
                index = 1;
                isPrimaryPage = true;
                guideline = null;
                page = const FavouritesPage();
                fab = null;
            case InformationPage.id:
                index = 2;
                isPrimaryPage = true;
                guideline = null;
                page = const InformationPage();
                fab = null;
            case GuidelinePage.id:
                isPrimaryPage = false;
                guideline = arguments!["guideline"];
                page = GuidelinePage(guideline!);
                fab = FavouriteFab(guideline!);
            default:
                isPrimaryPage = false;
                guideline = null;
                page = const Placeholder();
        }

        // Inform dependent widgets to update
        notifyListeners();
    }

    void setActivePageByIndex(int index) {
        return switch (index) {
            0 => setActivePage(IndexPage.id),
            1 => setActivePage(FavouritesPage.id),
            2 => setActivePage(InformationPage.id),
            _ => setActivePage("undefined")
        };
    }

    void handleBackButtonFromGuidelinePage() {

    }
}
