/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'package:flutter/material.dart';

import 'favourite_button.dart';

class GuidelineFloatingButtons extends StatelessWidget {
    const GuidelineFloatingButtons(this._isFavourite, { Key? key }): super(key: key);

    final bool _isFavourite;

    @override
    Widget build(BuildContext context) {
        return Positioned(
            child: Column(
                children: [
                    Transform.scale(
                        child: FavouriteButton(_isFavourite),
                        scale: 1.8
                    )
                ]
            ),
            bottom: 40,
            right: 25,
        );
    }
}
