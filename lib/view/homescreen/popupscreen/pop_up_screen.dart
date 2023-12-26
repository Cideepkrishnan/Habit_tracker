import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/view/homescreen/popupscreen/settings_screen.dart';

class PopUpScreen extends StatelessWidget {
  const PopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.black,
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ));
          },
          child: Text(
            "Settings",
            style:
                GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
          ),
          value: 1,
        ),
        PopupMenuItem(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ));
          },
          child: Text(
            "Privacy Policy",
            style:
                GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),
          ),
          value: 2,
        ),
      ],
    );
  }
}
