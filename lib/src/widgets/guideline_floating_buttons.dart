import 'package:flutter/material.dart';

import 'guideline.dart';

class GuidelineFloatingButtons extends StatelessWidget {
    const GuidelineFloatingButtons(this.isCommercial, { Key? key }): super(key: key);

    final bool isCommercial;

    Widget createSwitch(context) {
        /*return SizedBox(
            width: 150,
            height: 90,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
                    value: isCommercial,
                    onChanged: (status) =>
                        Guideline.of(context)!.toggleStandard(status)
                )
            )
        );*/
        return Transform.scale(
            child: Switch(
                value: isCommercial,
                onChanged: (status) =>
                    Guideline.of(context)!.toggleStandard(status)
            ),
            scale: 1.7
        );
    }

    @override
    Widget build(BuildContext context) {
        return Positioned(
            child: Column(
                children: [
                    createSwitch(context),
                    //RichText(
                    //    text: TextSpan(
                    //        text: isCommercial ? 'Commercial' : 'Private',
                    //        style: Theme.of(context).textTheme.subtitle2
                    //    )
                    //)
                    Text(
                        isCommercial ? 'Commercial' : 'Private',
                        style: Theme.of(context).textTheme.subtitle2
                    )
                ]
            ),
            bottom: 20,
            right: 10,
            width: 100
        );
    }
}
