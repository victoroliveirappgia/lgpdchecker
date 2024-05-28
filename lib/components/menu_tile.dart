import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTile extends StatelessWidget {

  final double height;
  final String label;
  final String logo;

  final Function() onPressed;

  MenuTile({
    required this.height,
    required this.label,
    required this.logo,
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
        minimumSize: MaterialStateProperty.all<Size>(Size(0, height)),
        fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(166.0)),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1A3F6D)),
      ),
      onPressed: onPressed,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: Image.asset('assets/$logo.png'),
            ),
            Text(
              '$label'.toUpperCase(),
              style: GoogleFonts.oswald(
                fontSize: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
