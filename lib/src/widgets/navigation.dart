import 'package:flutter/material.dart';

import 'index.dart';
import 'information.dart';
import 'favourites.dart';
import 'guideline.dart';

import '../style.dart';

class Navigation extends StatefulWidget {
    const Navigation(this.currentRoute, { Key? key }): super(key: key);

    final String currentRoute;

    @override
    State<Navigation> createState() => _NavigationState();
}


class _NavigationState extends State<Navigation> {
    _NavigationState();

    int? _selectedIndex = 0;

    void _onItemTapped(int index, BuildContext context) {
        setState(() {
            _selectedIndex = index;
            var route = '/';
            switch (index) {
                case 0:
                    route = Index.routeName;
                    break;
                case 1:
                    route = Favourites.routeName;
                    break;
                case 2:
                    route = Information.routeName;
                    break;
            }
            if (route != widget.currentRoute) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    route,
                    (Route<dynamic> r) => false
                );
            }
        });
    }

    @override
    void initState() {
        super.initState();
        switch (widget.currentRoute) {
            case Index.routeName:
                _selectedIndex = 0;
                break;
            case Favourites.routeName:
                _selectedIndex = 1;
                break;
            case Information.routeName:
                _selectedIndex = 2;
                break;
            default:
                _selectedIndex = null;
                break;
        }
    }

    @override
    Widget build(BuildContext context) {
        return BottomNavigationBar(
            items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Index'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favourites'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.commute),
                    label: 'Information'
                )
            ],
            selectedItemColor: (_selectedIndex != null)
                ? Theme.of(context).primaryColor
                : Theme.of(context).navBarUnselectedColor,
            unselectedItemColor: Theme.of(context).navBarUnselectedColor,
            backgroundColor: Theme.of(context).navBarColor,
            currentIndex: _selectedIndex ?? 0,
            onTap: (index) => _onItemTapped(index, context)
        );
    }
}
