import 'package:flutter/material.dart';

import '../style.dart';
import 'guideline_container.dart';

class FavouriteButton extends StatelessWidget {
    const FavouriteButton(this.isFavourite, { Key? key }): super(key: key);

    final bool isFavourite;

    @override
    Widget build(BuildContext context) {
        return IconButton(
            icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_border,
                color: isFavourite ? Colors.red[700] : Theme.of(context).navBarUnselectedColor,
                semanticLabel: isFavourite ? 'Remove from favourites' : 'Add to favourites'
            ),
            onPressed: () {
                if (isFavourite) {
                    GuidelineContainer.of(context)!.toggleFavourite(false);
                } else {
                    GuidelineContainer.of(context)!.toggleFavourite(true);
                }
            }
        );
    }
}
