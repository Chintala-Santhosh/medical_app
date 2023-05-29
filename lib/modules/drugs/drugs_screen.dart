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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
        Container(
          height: MediaQuery.of(context).size.height/10,
          color: Colors.white,
          padding: const EdgeInsets.only(top: 40,left: 10,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Cancel",style: TextStyle(
                  fontSize: 25,color: Colors.cyan
              ),),
              Text("NEW DRUG",style: TextStyle(
                  fontSize: 25,
              ),),
              Text("Save",style: TextStyle(
                  fontSize: 25,color: Colors.cyan
              ),),

            ],
          ),
        ),
          const Divider(
            thickness: 1.0,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              color: Colors.white,
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: ListView.builder(
                  itemCount: drugDetails.length,
                    itemBuilder: (BuildContext context,int index){
                    return  Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15,right: 15,),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    Text(drugDetails[index].title,style: TextStyle(color: Colors.grey.shade700,fontSize: 16,),),
                                    Visibility(
                                      visible:drugDetails[index].title=="Client" || drugDetails[index].title == "Prescription Drug",
                                        child: const Text("*",style: TextStyle(fontSize: 16,color: Colors.red),)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              GestureDetector(
                                onTap: (){
                                  drugDetails[index].isSelected=!drugDetails[index].isSelected;
                                  setState(() {

                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(drugDetails[index].subTitle,style: const TextStyle(fontSize: 18,color: Colors.black),),
                                    GestureDetector(
                                        child: drugDetails[index].isSelected?drugDetails[index].forwardIcon.isNotEmpty?Image.asset(drugDetails[index].forwardIcon,width: 14,height: 18,):Container():drugDetails[index].dropDownIcon.isNotEmpty?Image.asset(drugDetails[index].dropDownIcon,width: 14,height: 18,):Container(),

                                    )
                                    ,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 15,right: 20),
                            child: const Divider(thickness: 1,)),

                      ],
                    );
                    }),
              ),
            ),
          ),
          // Container(
          //
          //     decoration: BoxDecoration(
          //       border: Border(top: BorderSide(width: 1,color: Colors.grey.shade400)),
          //       // color: Colors.cyan,
          //     ),
          //     padding: EdgeInsets.only(top: 150,bottom: 10),
          //     child: const Divider(thickness: 1,)),
          // Container(
          //   padding: EdgeInsets.only(right: 10,bottom: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: const [
          //       Text("Done",style: TextStyle(color: Colors.blue),),
          //     ],
          //   ),
          // ),
          // Container(
          //   color: Colors.grey,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 0),
          //     child: Column(
          //       children: [
          //
          //         Container(
          //           height: 35,
          //           decoration: BoxDecoration(
          //             border: Border.all(width: 0.5),
          //             color: Colors.black26,
          //
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SingleChildScrollView(
          //   child: Container(
          //     color: Colors.grey,
          //     height: 50,
          //     child: ListView.builder(
          //         scrollDirection: Axis.vertical,
          //         shrinkWrap: true,
          //         itemCount: 8,
          //         itemBuilder: (BuildContext context,int index){
          //           count=index;
          //           return Container(
          //             padding: const EdgeInsets.only(left: 30,right: 30,top:0,bottom: 10),
          //             // color: Colors.grey,
          //
          //             child:  Center(child: Text("EVERY ${(count+1).toString()} MONTH" ,style: const TextStyle(fontSize: 25,),)),
          //           );
          //
          //         }),
          //   ),
          // ),
        ],
      ),
    );
  }
}