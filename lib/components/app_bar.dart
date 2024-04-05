// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";

import "../src/style.dart";

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
    const MainAppBar({ this.title, super.key });

    final String? title;

    @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);

    void showApplicationAboutDialog(BuildContext context) {
        // The legal small print displayed under the about heading
        String legalese = "Copyright 2022-2024";
        legalese += "\nAll Rights Reserved";
        legalese += "\nLicensed under the GPLv3";

        // The body of the about dialog
        // TODO: consider making this a markdown document
        List<Widget> items = [];
        items.add(const SizedBox(height: 20));
        items.add(Text(
            'Jath Palasubramaniam',
            style: Theme.of(context).textTheme.smallText1,
            textAlign: TextAlign.start
        ));
        items.add(const SizedBox(height: 2.5));
        items.add(Text(
            'jathpala@gmail.com',
            style: Theme.of(context).textTheme.smallText1,
            textAlign: TextAlign.start
        ));
        items.add(const SizedBox(height: 2.5));
        items.add(Text(
            'github.com/jathpala/driving_guidelines',
            style: Theme.of(context).textTheme.smallText1,
            textAlign: TextAlign.start
        ));
        items.add(const SizedBox(height: 20));
        items.add(Text(
            'If you notice any errors or have any suggestions please send me an email or create a github issue.',
            style: Theme.of(context).textTheme.smallText1,
            textAlign: TextAlign.justify
        ));
        items.add(const SizedBox(height: 20));
        items.add(Text(
            'Icons from Flaticon',
            style: Theme.of(context).textTheme.smallText1.copyWith(
                fontSize: 12
            ),
            textAlign: TextAlign.justify
        ));
        items.add(const SizedBox(height: 2));
        items.add(Text(
            'https://www.flaticon.com/free-icons/driver-license',
            style: Theme.of(context).textTheme.smallText1.copyWith(
                fontSize: 12
            ),
            textAlign: TextAlign.justify
        ));

        // Display the about dialog
        showAboutDialog(
            context: context,
            applicationVersion: 'v1.1.0',
            applicationLegalese: legalese,
            applicationIcon: Image.asset(
                'assets/icons/app_logo_white_bg.png',
                height: 35,
                width: 35
            ),
            children: items,
        );
    }


    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(title ?? "Driving Guidelines")
            ),
            automaticallyImplyLeading: false,
            leading: null,
            actions: [
                MenuAnchor(
                    builder: (BuildContext context, MenuController controller, Widget? child) {
                        return IconButton(
                            onPressed: () {
                                if (controller.isOpen) {
                                    controller.close();
                                } else {
                                    controller.open();
                                }
                            },
                            icon: const Icon(Icons.more_vert),
                            tooltip: "Options"
                        );
                    },
                    menuChildren: [
                        MenuItemButton(
                            onPressed: () => showApplicationAboutDialog(context),
                            child: const Text("About")
                        )
                    ]
                )
            ]
        );
    }
}
