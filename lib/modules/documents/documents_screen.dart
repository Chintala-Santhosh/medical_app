import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_bar.dart';
import '../utils/body_screen.dart';
import 'models/documents_model.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {

  List<DocumentsModel>documentsList=[];
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
    String data = await rootBundle.loadString('assets/json/documents.json');
    var jsonResult = json.decode(data);
    if(jsonResult!=null){
      for (int i = 0; i < jsonResult.length; i++) {
        documentsList.add(DocumentsModel.fromJson(jsonResult[i]));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:   [
          AppBarScreen(title: "Documents",),
          BodyScreen(name:"007EDIT,001",date: "01/06/2023(Fri)",),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: documentsList.length,
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
                                  Text(documentsList[index].fileName),
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
          )
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