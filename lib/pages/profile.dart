import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'model/checkbox_state.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var complyingCount;
  var notComplyingCount;
  late int total = complyingCount + notComplyingCount;
  late int percentage = ((complyingCount * 100) / total).toInt();

  @override
  void initState() {
    super.initState();

    var box = Hive.box<CheckBoxState>('lgpd_checkboxes');

    complyingCount = box
        .toMap()
        .entries
        .where((checkbox) => checkbox.value.value == true)
        .map((checkbox) => checkbox.value)
        .toList()
        .length;

    notComplyingCount = box
        .toMap()
        .entries
        .where((checkbox) => checkbox.value.value == false)
        .map((checkbox) => checkbox.value)
        .toList()
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C4E89),
      body: Container(
        margin: EdgeInsets.only(top: 105.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 170.0,
                height: 170.0,
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/avatar.png'),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Dani C',
                style: GoogleFonts.oswald(fontSize: 28.0, color: Colors.white),
              ),
              Text(
                'danic@example.com',
                style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 65.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 155.0,
                      height: 200.0,
                      margin: EdgeInsets.only(right: 11.5),
                      decoration: BoxDecoration(
                        color: Color(0xff9FC7F8),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$percentage%',
                              style: GoogleFonts.oswald(
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1C4E89))),
                          Text('compliant \nwith LGPD'.toUpperCase(),
                              textAlign: TextAlign.start,
                              style: GoogleFonts.oswald(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                    Container(
                      width: 155.0,
                      height: 200.0,
                      padding: EdgeInsets.symmetric(vertical: 21.0),
                      margin: EdgeInsets.only(left: 11.5),
                      decoration: BoxDecoration(
                        color: Color(0xff9FC7F8),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('$complyingCount',
                              style: GoogleFonts.oswald(
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1C4E89))),
                          Text(
                              'regulation \ncriteria topics \nchecked'
                                  .toUpperCase(),
                              textAlign: TextAlign.start,
                              style: GoogleFonts.oswald(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
