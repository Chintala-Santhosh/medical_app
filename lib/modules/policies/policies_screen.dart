import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_bar.dart';
import '../utils/body_screen.dart';
import 'models/policies_model.dart';

class PoliciesScreen extends StatefulWidget {
  const PoliciesScreen({Key? key}) : super(key: key);

  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {

  List<PolicyModel>policiesList=[];
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
    String data = await rootBundle.loadString('assets/json/policy.json');
    var jsonResult = json.decode(data);
    if(jsonResult!=null){
      for (int i = 0; i < jsonResult.length; i++) {
        policiesList.add(PolicyModel.fromJson(jsonResult[i]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:   [
          const AppBarScreen(title: "Policies",),
          const BodyScreen(name:"007EDIT,001",date: "ADVANTRA",),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: policiesList.length,
                  itemBuilder: (BuildContext context,int index){
                    return  Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(policiesList[index].policyName),
                                  const SizedBox(height: 5,),
                                  Text("Status: ${policiesList[index].status}"),
                                  const SizedBox(height: 5,),
                                  Text("Plan: ${policiesList[index].plan}"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("StartDate: ${policiesList[index].startDate}"),
                                  const SizedBox(height: 5,),
                                  Text("PolicyNo: ${policiesList[index].policyNo}"),
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