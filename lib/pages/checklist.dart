import 'package:easycomply/pages/model/checkbox_state.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expandable/expandable.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  var updatedItems;
  var sectionTitlesDuplicates = [];
  var sectionTitles = [];

  @override
  void initState() {
    var box = Hive.box<CheckBoxState>('lgpd_checkboxes');

    updatedItems =
        box.toMap().entries.map((checkboxItem) => checkboxItem.value).toList();

    updatedItems.forEach((item) {
      sectionTitlesDuplicates.add(item.sessionTitle);
    });

    sectionTitles = sectionTitlesDuplicates.toSet().toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist'),
        backgroundColor: Color(0xFF1C4E89),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        children: [
          ...sectionTitles.map((e) => buildSingleAccordion(e)).toList(),
        ],
      ),
    );
  }

  buildSingleAccordion(String title) {
    return ExpansionTile(
      textColor: Colors.white,
      collapsedIconColor: Color(0xFF1C4E89),
      iconColor: Colors.white,
      backgroundColor: Color(0xFF1C4E89),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      children: [
        ...updatedItems
            .where((checkbox) => checkbox.sessionTitle == title)
            .map(buildSingleCheckbox)
            .toList()
      ],
    );
  }

  buildSingleCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color(0xFF1C894D),
      value: checkbox.value,
      title: Text(
        checkbox.title,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
      onChanged: (value) => setState(() {
        checkbox.value = value!;
        checkbox.save();
      }),
    );
  }
}
