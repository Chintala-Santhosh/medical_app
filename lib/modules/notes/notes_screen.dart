import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_bar.dart';
import '../utils/body_screen.dart';
import 'models/notes_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<NotesModel>notesList=[];
  @override
  void initState() {

    Future.delayed(Duration.zero, () {
      setState(() {
        loadJson();
      });
    });
    super.initState();
  }

  loadJson() async {
    String data = await rootBundle.loadString('assets/json/notes.json');
    var jsonResult = json.decode(data);
    if(jsonResult!=null){
      for (int i = 0; i < jsonResult.length; i++) {
        notesList.add(NotesModel.fromJson(jsonResult[i]));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:   [
          const AppBarScreen(title: "Notes",),
          const BodyScreen(name:"007EDIT,001",date: "01/06/2023(Fri)",),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (BuildContext context,int index){
                    return  Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(notesList[index].message),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(thickness: 1,)
                      ],
                    );
                  }),
            ),
          ),

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