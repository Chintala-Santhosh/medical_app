import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app/modules/documents/documents_screen.dart';
import 'package:medical_app/modules/drugs/drugs_screen.dart';
import 'package:medical_app/modules/notes/notes_screen.dart';
import 'package:medical_app/modules/policies/policies_screen.dart';

import 'modules/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens=[
    const ProfileScreen(),
    const PoliciesScreen(),
    const NotesScreen(),
    const DocumentsScreen(),
     const DrugScreen(
    ),];
  int currentIndex=0;
@override
  void initState() {
    super.initState();
  }
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        exit(0);
      },

      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: onTabTapped,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.cyan,
          showUnselectedLabels: true,
          unselectedItemColor:Colors.grey ,

          items:  [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_remove_alt_1,color: currentIndex==0?Colors.cyan:Colors.grey,),
              label: "Profile"
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined,color: currentIndex==1?Colors.cyan:Colors.grey,),
              label: "Policies"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.event_note_sharp,color: currentIndex==2?Colors.cyan:Colors.grey,),
              label: "Notes"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.speaker_notes_sharp,color: currentIndex==3?Colors.cyan:Colors.grey,),
              label: "Documents"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.medication,color: currentIndex==4?Colors.cyan:Colors.grey,),
              label: "Drugs"
            ),
          ],
        ),
      ),
    );
  }
}
