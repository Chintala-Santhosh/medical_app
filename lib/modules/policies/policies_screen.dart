import 'dart:convert';
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
  bool isShow = true;
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
           const AppBarScreen(title: "POLICES",isFromHome:false),
           BodyScreen(name:"007EDIT, 001",date: "ADVANTRA",isShow: isShow,),
          Visibility(
            visible: isShow,
            child: Expanded(
              child: Container(
                color: Colors.white,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: policiesList.length,
                      itemBuilder: (BuildContext context,int index){
                        return  Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(policiesList[index].policyName,style: TextStyle(color: Colors.lightBlue.shade400,fontSize: 20),),
                                      Text("StartDate: ${policiesList[index].startDate}",style: const TextStyle(color: Colors.black,fontSize: 16),),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Status: ${policiesList[index].status}",style: const TextStyle(color: Colors.black,fontSize: 16)),
                                      const SizedBox(height: 5,),
                                      Text("PolicyNo: ${policiesList[index].policyNo}",style: const TextStyle(color: Colors.black,fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Plan: ${policiesList[index].plan}",style: const TextStyle(color: Colors.black,fontSize: 16)),
                                      const SizedBox(height: 5,),

                                    ],
                                  ),


                                ],
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 10,),
                                child: const Divider(thickness: 1,))
                          ],
                        );
                      }),
                ),
              ),
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