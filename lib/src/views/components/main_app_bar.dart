// // Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// // Licensed under the GNU General Public License (version 3).

// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// import '../../style.dart';
// // import '../../models/window_model.dart';


// class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
//     const MainAppBar({ Key? key, this.title }): super(key: key);

//     final String? title;

//     @override
//     Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//     /// Shows an about dialog window
//     void showApplicationAboutDialog(BuildContext context) {
//         // The legal small print displayed under the about heading
//         var legalese = 'Copyright 2022';
//         legalese += '\nAll Rights Reserved';
//         legalese += '\nLicenced under the GPLv3';

//         // The body of the about dialog
//         // TODO: consider making this a markdown document
//         List<Widget> items = [];
//         items.add(const SizedBox(height: 20));
//         items.add(Text(
//             'Jath Palasubramaniam',
//             style: Theme.of(context).textTheme.smallText1,
//             textAlign: TextAlign.start
//         ));
//         items.add(const SizedBox(height: 2.5));
//         items.add(Text(
//             'jathpala@gmail.com',
//             style: Theme.of(context).textTheme.smallText1,
//             textAlign: TextAlign.start
//         ));
//         items.add(const SizedBox(height: 2.5));
//         items.add(Text(
//             'github.com/jathpala/driving_guidelines',
//             style: Theme.of(context).textTheme.smallText1,
//             textAlign: TextAlign.start
//         ));
//         items.add(const SizedBox(height: 20));
//         items.add(Text(
//             'If you notice any errors or have any suggestions please send me an email or create a github issue.',
//             style: Theme.of(context).textTheme.smallText1,
//             textAlign: TextAlign.justify
//         ));
//         items.add(const SizedBox(height: 20));
//         items.add(Text(
//             'Icons from Flaticon',
//             style: Theme.of(context).textTheme.smallText1.copyWith(
//                 fontSize: 12
//             ),
//             textAlign: TextAlign.justify
//         ));
//         items.add(const SizedBox(height: 2));
//         items.add(Text(
//             'https://www.flaticon.com/free-icons/driver-license',
//             style: Theme.of(context).textTheme.smallText1.copyWith(
//                 fontSize: 12
//             ),
//             textAlign: TextAlign.justify
//         ));

//         // Display the about dialog
//         showAboutDialog(
//             context: context,
//             applicationVersion: 'v1.1.0',
//             applicationLegalese: legalese,
//             applicationIcon: Image.asset(
//                 'assets/icons/app_logo_white_bg.png',
//                 height: 35,
//                 width: 35
//             ),
//             children: items,
//         );
//     }

//     /// The three-dot options menu on the right of the app bar
//     Widget optionsMenu(BuildContext context) {
//         return PopupMenuButton(
//             itemBuilder: (context) {
//                 return [
//                     PopupMenuItem<int>(
//                         value: 0,
//                         child: Text(
//                             'About',
//                             style: Theme.of(context).textTheme.smallText1
//                         ),
//                     )
//                 ];
//             },
//             onSelected: (value) {
//                 switch (value) {
//                     case 0:
//                         showApplicationAboutDialog(context);
//                         break;
//                 }
//             }
//         );
//     }

//     @override
//     Widget build(BuildContext context) {
//         return Consumer<WindowModel>(
//             builder: (context, view, child) {
//                 return AppBar(
//                     title: SingleChildScrollView(
//                         child: Text(title ?? view.title),
//                         scrollDirection: Axis.horizontal
//                     ),
//                     automaticallyImplyLeading: false,
//                     leading: null,
//                     actions: [optionsMenu(context)]
//                 );
//             }
//         );
//     }
// }
