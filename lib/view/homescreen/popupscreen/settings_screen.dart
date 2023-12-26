import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/database/database.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: database.settingsScreen.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: database.settingsScreen[index]["icon"],
                    title: database.settingsScreen[index]["title"],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
