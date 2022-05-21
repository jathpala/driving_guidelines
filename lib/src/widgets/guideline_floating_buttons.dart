import 'package:flutter/material.dart';

import '../style.dart';
import 'guideline.dart';

class GuidelineFloatingButtons extends StatelessWidget {
    const GuidelineFloatingButtons(this.isCommercial, { Key? key }): super(key: key);

    final bool isCommercial;

    Widget createSwitch(context) {
        return Transform.scale(
            child: Switch(
                value: isCommercial,
                onChanged: (status) =>
                    Guideline.of(context)!.toggleStandard(status),
                activeColor: Theme.of(context).commercialStandardColor,
                inactiveThumbColor: Theme.of(context).privateStandardColor,
                activeTrackColor: Theme.of(context).commercialStandardColorDarkened,
                inactiveTrackColor: Theme.of(context).privateStandardColorDarkened
            ),
            scale: 1.7,
        );
    }

    @override
    Widget build(BuildContext context) {
        return Positioned(
            child: Column(
                children: [
                    createSwitch(context),
                    Text(
                        isCommercial ? 'Commercial' : 'Private',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: isCommercial ?
                                Theme.of(context).commercialStandardColorDarkened :
                                Theme.of(context).privateStandardColorDarkened
                        )
                    )
                ]
            ),
            bottom: 20,
            right: 10,
            width: 100
        );
    }
}
