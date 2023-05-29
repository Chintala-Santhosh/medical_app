import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main_screen.dart';

class AppBarScreen extends StatelessWidget {
  final bool isFromHome;
  final Icon? backButtonIcon;
  final Icon? screenIcon;
  final String? title;
  final Icon? refreshIcon;
  const AppBarScreen({Key? key,required this.isFromHome, this.backButtonIcon,this.screenIcon,this.refreshIcon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: MediaQuery.of(context).size.height/14,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 30,left: 0,right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  if(isFromHome){
                    SystemNavigator.pop();
                  }else{
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const MainScreen()));
                  }


                },
                child: Container(
                    child: backButtonIcon??const Icon(Icons.arrow_back_ios,size: 35,)),
              ),
               const SizedBox(width:10),
              GestureDetector(
                onTap: (){

                },
                  child: screenIcon??const Icon(Icons.home,size: 35,)),

            ],
          ),
          // const SizedBox(width:10),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(title??"",style: const TextStyle(
                fontSize: 25
            ),),
          ),
          const SizedBox(width:10),


          GestureDetector(
            onTap: (){

            },
              child: refreshIcon??const Icon(Icons.sync,size: 35,)),

        ],
      ),
    );
  }
}
