import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/drug_details_model.dart';

class DrugScreen extends StatefulWidget {
    const DrugScreen({Key? key,}) : super(key: key);

  @override
  State<DrugScreen> createState() => _DrugScreenState();
}

class _DrugScreenState extends State<DrugScreen> {

  List<DrugDetails>drugDetails=[];
  int count=0;
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
    String data = await rootBundle.loadString('assets/json/drug_history.json');
    var jsonResult = json.decode(data);
    if(jsonResult!=null){
      for (int i = 0; i < jsonResult.length; i++) {
        drugDetails.add(DrugDetails.fromJson(jsonResult[i]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:   [
        Container(
          height: 70,
          color: Colors.white,
          padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Cancel",style: TextStyle(
                  fontSize: 20,color: Colors.blue
              ),),
              Text("New Drug",style: TextStyle(
                  fontSize: 20,
              ),),
              Text("Save",style: TextStyle(
                  fontSize: 20,color: Colors.blue
              ),),

            ],
          ),
        ),
          const Divider(
            thickness: 1.0,
          ),
          Expanded(
            child: Container(
              height: 50,
              color: Colors.white,
              child: ListView.builder(
                itemCount: drugDetails.length,
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
                                Row(
                                  children: [
                                    Text(drugDetails[index].title),
                                    Visibility(
                                      visible:drugDetails[index].title=="Client" || drugDetails[index].title == "Prescription Drug",
                                        child: const Text("*",style: TextStyle(fontSize: 14,color: Colors.red),)),
                                  ],
                                ),
                                Text(drugDetails[index].subTitle),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(drugDetails[index].iconImage,width: 14),
                              ],
                            ),

                          ],
                        ),
                      ),
                      const Divider(thickness: 1,),

                    ],
                  );
                  }),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("Done",style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 0),
              child: Column(
                children: [

                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.black26,

                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.grey,
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext context,int index){
                    count=index;
                    return Container(
                      padding: const EdgeInsets.only(left: 30,right: 30,top:0,bottom: 10),
                      // color: Colors.grey,

                      child:  Center(child: Text("EVERY ${(count+1).toString()} MONTH" ,style: TextStyle(fontSize: 25,),)),
                    );

                  }),
            ),
          ),
        ],
      ),
    );
  }
}