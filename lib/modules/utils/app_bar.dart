import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  final Icon? backButtonIcon;
  final Icon? screenIcon;
  final String? title;
  final Icon? refreshIcon;
  const AppBarScreen({Key? key,this.backButtonIcon,this.screenIcon,this.refreshIcon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20,left: 10,right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              backButtonIcon??const Icon(Icons.arrow_back_ios),
              const SizedBox(width: 20,),
              screenIcon??const Icon(Icons.home),
            ],
          ),
          Text(title??"",style: const TextStyle(
            fontSize: 20
          ),),
          Row(
            children: [

              const SizedBox(width: 20,),
              refreshIcon??const Icon(Icons.sync)
            ],
          ),

        ],
      ),
    );
  }
}
