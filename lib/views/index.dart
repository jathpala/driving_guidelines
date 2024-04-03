/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import "package:flutter/material.dart";
import "package:provider/provider.dart";

const list = {
  "congenital_heart_disease": {
    "name": "Congenital Heart Disease",
    "categories": [
      "cardiovascular"
    ],
    "group": "structural"
  },
  "cardiac_arrest": {
    "name": "Cardiac Arrest",
    "categories": [
      "cardiovascular",
      "blackouts"
    ],
    "group": "rhythm_disorders"
  },
  "dilated_cardiomyopathy": {
    "name": "Dilated Cardiomyopathy",
    "categories": [
      "cardiovascular"
    ],
    "group": "heart_failure"
  },
  "diplopia": {
    "name": "Diplopia",
    "categories": [
      "other"
    ],
    "group": "visual_disorders"
  },
  "ecg_abnormalities": {
    "name": "ECG Abnormalities",
    "categories": [
      "cardiovascular"
    ],
    "group": "rhythm_disorders"
  },
  "ventricular_assist_device": {
    "name": "Ventricular Assist Device",
    "categories": [
      "cardiovascular"
    ],
    "group": "heart_failure"
  },
  "valvular_heart_disease": {
    "name": "Valvular Heart Disease",
    "categories": [
      "cardiovascular"
    ],
    "group": "structural"
  },
  "diabetes_mellitus_non_insulin": {
    "name": "Diabetes Mellitus, Treated with Non-insulin Medication",
    "categories": [
      "other"
    ],
    "group": "diabetes"
  },
  "permanent_pacemaker": {
    "name": "Permanent Pacemaker",
    "categories": [
      "cardiovascular"
    ],
    "group": "rhythm_disorders"
  },
  "visual_fields": {
    "name": "Visual Field Defects",
    "categories": [
      "other"
    ],
    "group": "visual_disorders"
  },
  "percutaneous_coronary_intervention": {
    "name": "Percutaneous Coronary Intervention",
    "categories": [
      "cardiovascular"
    ],
    "group": "ischaemic_heart_disease"
  },
  "cardiac_arrhythmias": {
    "name": "Cardiac Arrhythmias",
    "categories": [
      "cardiovascular",
      "blackouts"
    ],
    "group": "rhythm_disorders"
  },
  "myocardial_infarction": {
    "name": "Myocardial Infarction",
    "categories": [
      "cardiovascular"
    ],
    "group": "ischaemic_heart_disease"
  },
  "implantable_cardiac_defibrillator": {
    "name": "Implantable Cardiac Defibrillator",
    "categories": [
      "cardiovascular"
    ],
    "group": "rhythm_disorders"
  },
  "sleep_apnoea": {
    "name": "Sleep Apnoea",
    "categories": [
      "other"
    ],
    "group": "sleep_disorders"
  },
  "aortic_aneurysm": {
    "name": "Aortic Aneurysm",
    "categories": [
      "cardiovascular"
    ],
    "group": "vascular"
  },
  "coronary_artery_bypass_grafting": {
    "name": "Coronary Artery Bypass Grafting",
    "categories": [
      "cardiovascular"
    ],
    "group": "ischaemic_heart_disease"
  },
  "angina": {
    "name": "Angina",
    "categories": [
      "cardiovascular"
    ],
    "group": "ischaemic_heart_disease"
  },
  "deep_vein_thrombosis": {
    "name": "Deep Vein Thrombosis",
    "categories": [
      "cardiovascular"
    ],
    "group": "vascular"
  },
  "psychiatric": {
    "name": "Psychiatric Conditions",
    "categories": [
      "other"
    ],
    "group": "psychiatry"
  },
  "anticoagulation": {
    "name": "Anticoagulation",
    "categories": [
      "other"
    ],
    "group": "medication"
  },
  "vasovagal_syncope": {
    "name": "Vasovagal Syncope",
    "categories": [
      "blackouts",
      "other"
    ],
    "group": "syncope"
  },
  "hearing_loss": {
    "name": "Hearing Loss",
    "categories": [
      "other"
    ],
    "group": "hearing_loss"
  },
  "syncope_with_unknown_cause": {
    "name": "Syncope with Unknown Cause",
    "categories": [
      "blackouts",
      "other"
    ],
    "group": "syncope"
  },
  "hypertension": {
    "name": "Hypertension",
    "categories": [
      "cardiovascular"
    ],
    "group": "risk_factors"
  },
  "hypertrophic_cardiomyopathy": {
    "name": "Hypertrophic Cardiomyopathy",
    "categories": [
      "cardiovascular"
    ],
    "group": "heart_failure"
  },
  "narcolepsy": {
    "name": "Narcolepsy",
    "categories": [
      "other"
    ],
    "group": "sleep_disorders"
  },
  "musculoskeletal": {
    "name": "Muschuloskeletal Disorders",
    "categories": [
      "other"
    ],
    "group": "musculoskeletal"
  },
  "pulmonary_embolism": {
    "name": "Pulmonary Embolism",
    "categories": [
      "cardiovascular"
    ],
    "group": "vascular"
  },
  "heart_transplant": {
    "name": "Heart Transplant",
    "categories": [
      "cardiovascular"
    ],
    "group": "heart_failure"
  },
  "substance_abuse": {
    "name": "Substance Abuse",
    "categories": [
      "other"
    ],
    "group": "substance_abuse"
  },
  "visual_acuity": {
    "name": "Visual Acuity",
    "categories": [
      "other"
    ],
    "group": "visual_disorders"
  },
  "diabetes_mellitus_insulin": {
    "name": "Diabetes Mellitus, Treated with Insulin",
    "categories": [
      "other"
    ],
    "group": "diabetes"
  },
  "diabetes_mellitus_lifestyle": {
    "name": "Diabetes Mellitus, Treated without Medication",
    "categories": [
      "other"
    ],
    "group": "diabetes"
  },
  "monocular_vision": {
    "name": "Monocular Vision",
    "categories": [
      "other"
    ],
    "group": "visual_disorders"
  },
  "atrial_fibrillation": {
    "name": "Atrial Fibrillation",
    "categories": [
      "cardiovascular"
    ],
    "group": "rhythm_disorders"
  },
  "cardiac_syncope": {
    "name": "Cardiac Syncope",
    "categories": [
      "cardiovascular",
      "blackouts"
    ],
    "group": "syncope"
  },
  "heart_failure": {
    "name": "Heart Failure",
    "categories": [
      "cardiovascular"
    ],
    "group": "heart_failure"
  }
};

class Index {
    Index(indexData) {
        indexData.forEach((key, value) {
            IndexItem item = IndexItem(id: key, name: value["name"]);
            for (String categoryId in value["categories"]) {
                IndexCategory indexCategory = _indexData.firstWhere(
                    (category) => category.id == categoryId,
                    orElse: () {
                        IndexCategory category = IndexCategory(id: categoryId);
                        _indexData.add(category);
                        return category;
                    }
                );
                indexCategory.add(item, value["group"]);
            }
        });
    }

    List<IndexCategory> _indexData = [];

    List<IndexCategory> get categories => _indexData;
}

class IndexItem {
    IndexItem({ required this.id, required this.name });

    final String id;
    final String name;
}

class IndexGroup {
    IndexGroup({ required this.id });

    final String id;

    List<IndexItem> items = [];

    void add(IndexItem newItem) {
        items.removeWhere((oldItem) => oldItem.id == newItem.id);
        items.add(newItem);
    }
}

class IndexCategory {
    IndexCategory({ required this.id, this.isExpanded = false });

    final String id;
    bool isExpanded;

    List<IndexGroup> groups = [];

    String get name {
        return switch (id) {
            "cardiovascular" => "Cardiovascular",
            "blackouts" => "Syncope",
            "other" => "Other",
            _ => "UNKNOWN"
        };
    }

    void add(IndexItem item, String groupId) {
        IndexGroup group = groups.firstWhere(
            (group) => group.id == groupId,
            orElse: () {
                IndexGroup group = IndexGroup(id: groupId);
                groups.add(group);
                return group;
            }
        );
        group.add(item);
    }
}


class IndexPage extends StatefulWidget {
    const IndexPage({ super.key });

    static const title = "Driving Guidelines";

    @override
    State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
    _IndexPageState();

    final Index _index = Index(list);

    @override
    Widget build(BuildContext context) {
        return SingleChildScrollView(
            child: ExpansionPanelList(
                children: _index.categories.map<ExpansionPanel>((IndexCategory category) {
                    return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                            return ListTile(
                                title: Text(category.name)
                            );
                        },
                        body: const ListTile(
                            title: Text("This is some text")
                        ),
                        isExpanded: category.isExpanded,
                        canTapOnHeader: true
                    );
                }).toList(),
                expansionCallback: (index, isExpanded) {
                    setState(() {
                        _index.categories[index].isExpanded = isExpanded;
                    });
                }
            )
        );
    }
}


// import '../style.dart';
// import '../guideline_window.dart';
// import '../models/index_model.dart';
// import '../models/preferences_model.dart';
// import '../models/window_model.dart';

// class Index extends StatefulWidget {
//     const Index({ Key? key }): super(key: key);

//     static const title = 'Driving Guidelines';

//     @override
//     State<Index> createState() => _IndexState();
// }


// class _IndexState extends State<Index> {
//     _IndexState();

//     List<bool>? _panelIsOpen;

//     List<Widget> buildPanelGroup(BuildContext context, PreferencesModel preferences, Map<String, String> guidelines) {
//         var sortedKeys = guidelines.keys.toList()..sort();
//         List<Widget> navigationList = [];
//         for (var id in sortedKeys) {
//             navigationList.add(Consumer<WindowModel>(
//                 builder: (context, view, child) {
//                     return ListTile(
//                         title: Text(
//                             guidelines[id]!,
//                             style: Theme.of(context).textTheme.subtitle1
//                         ),
//                         trailing: IconButton(
//                             icon: Icon(
//                                 preferences.favourites.contains(id) ? Icons.favorite : Icons.favorite_border,
//                                 color: preferences.favourites.contains(id) ? Colors.red : Theme.of(context).navBarUnselectedColor
//                             ),
//                             onPressed: () {
//                                 preferences.toggleFavourite(id);
//                             }
//                         ),
//                         dense: false,
//                         onTap: () {
//                             Navigator.pushNamed(
//                                 context,
//                                 GuidelineWindow.routeName,
//                                 arguments: {
//                                     'guideline': id,
//                                 }
//                             );
//                         }
//                     );
//                 }
//             ));
//         }
//         return navigationList;
//     }

//     List<Widget> buildPanelList(BuildContext context, PreferencesModel preferences, Map<String, Map<String, String>>? sortedGuidelines) {
//         List<Widget> navigationList = [];
//         var firstGroup = true;
//         sortedGuidelines?.forEach((group, guidelines) {
//             if (!firstGroup) {
//                 navigationList.add(const Divider());
//             }
//             navigationList.addAll(buildPanelGroup(context, preferences, guidelines));
//             firstGroup = false;
//         });
//         return navigationList;
//     }

//     ExpansionPanel buildPanel(BuildContext context, PreferencesModel preferences, int panelNumber, String categoryName, Map<String, Map<String, String>>? sortedGuidelines) {
//         return ExpansionPanel(
//             headerBuilder: (context, isOpen) {
//                 return Container(
//                     child: Text(
//                         categoryName,
//                         style: Theme.of(context).textTheme.headline3
//                     ),
//                     padding: const EdgeInsets.only(
//                         top: 15,
//                         bottom: 15,
//                         left: 20,
//                         right: 20
//                     )
//                 );
//             },
//             body: Column(
//                 children: buildPanelList(context, preferences, sortedGuidelines)
//             ),
//             canTapOnHeader: true,
//             isExpanded: _panelIsOpen![panelNumber]
//         );
//     }

//     List<ExpansionPanel> buildPanels(BuildContext context, IndexModel index, PreferencesModel preferences) {
//         List<ExpansionPanel> panelList = [];
//         var categories = {
//             'blackouts': 'Syncope',
//             'cardiovascular': 'Cardiovascular',
//             'other': 'Other'
//         };
//         _panelIsOpen ??= List.filled(categories.length, false);
//         var i = 0;
//         for (var c in categories.keys.toList()) {
//             panelList.add(buildPanel(context, preferences, i, categories[c]!, index.sortedGuidelines[c]));
//             i++;
//         }
//         return panelList;
//     }

//     @override
//     Widget build(BuildContext context) {
//         return Consumer2<IndexModel, PreferencesModel>(
//             builder: (context, index, preferences, child) {
//                 return SingleChildScrollView(
//                     child: ExpansionPanelList(
//                         children: buildPanels(context, index, preferences),
//                         expansionCallback: (i, isOpen) {
//                             setState(() {
//                                 // TODO: There is a bug somewhere as the commented line should work
//                                 // _panelIsOpen?[i] = !isOpen;
//                                 _panelIsOpen?[i] = !_panelIsOpen![i];
//                             });
//                         }
//                     )
//                 );
//             }
//         );
//     }
// }
