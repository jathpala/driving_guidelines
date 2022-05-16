import 'package:flutter/material.dart';

import 'guideline.dart';

class GuidelineList extends StatelessWidget {
    const GuidelineList({ Key? key }): super(key: key);
    @override
    Widget build(BuildContext context) {
        return ListView(
            children: [
                ListTile(
                    title: const Text('Coronary Artery Bypass Grafting'),
                    onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Guideline('coronary_artery_bypass_grafting')
                            )
                        );
                    }
                ),
                ListTile(
                    title: const Text('Percutaneous Coronary Intervention')
                )
            ]
        );
    }
}
