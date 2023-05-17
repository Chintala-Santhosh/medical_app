import 'package:flutter/material.dart';
import 'package:medical_app/modules/utils/body_screen.dart';

import '../utils/app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  const [
          AppBarScreen(title: "Profile",),
          BodyScreen(name:"007EDIT,001",date: "01/06/2023(Fri)",),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.deepOrange.shade400,
        onPressed: () {  },
        child: const Icon(Icons.add),
      ),
    );
  }
}
