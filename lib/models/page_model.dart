// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";

import "../views/index.dart";
import "../views/favourites.dart";
import "../views/information.dart";
import "../views/guideline.dart";


class PageModel extends ChangeNotifier {
    PageModel() {
        setActivePage(IndexPage.id);
    }

    // Index for the navigation bar widget
    // 0 = Index
    // 1 = Favourites
    // 2 = Information
    // null = Another page
    int? index = 0;

    // Title to be displayed in the app bar
    String _title = "";
    String get title => _title;
    set title(String value) {
        _title = value;
        notifyListeners();
    }

    // View to be displayed in the main window
    Widget page = const Placeholder();

    void setActivePage(String pageId, { Map<String, dynamic>? arguments }) {
        switch (pageId) {
            case IndexPage.id:
                index = 0;
                page = const IndexPage();
            case FavouritesPage.id:
                index = 1;
                page = const FavouritesPage();
                break;
            case InformationPage.id:
                index = 2;
                page = const InformationPage();
                break;
            case GuidelinePage.id:
                page = GuidelinePage(arguments!["guideline"]);
            default:
                page = const Placeholder();
                break;
        }

        // Inform dependent widgets to update
        notifyListeners();
    }

    void handleNavBarSelection(int index) {
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
