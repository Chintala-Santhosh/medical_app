import 'package:flutter/material.dart';
import 'package:medical_app/modules/utils/my_colors.dart';

class BodyScreen extends StatefulWidget {
  final String? name;
  final String? date;
  final Icon? minimizeIcon;
  final Icon? dropdownIcon;
   bool isShow;
    BodyScreen({Key? key,this.name,this.date,this.minimizeIcon, this.dropdownIcon, required this.isShow}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: MediaQuery.of(context).size.height/16,
          color:HexColor("#5bd8ea"),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children:  [
                  Center(
                    child: Text(widget.name??"",style: const TextStyle(fontSize: 22,color: Colors.white),),

                  ),
                  const SizedBox(width: 100),
                  widget.minimizeIcon??const Icon(Icons.zoom_in_map_sharp,color: Colors.white,),

                ],


              ),

            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            widget.isShow=!widget.isShow;
            setState(() {

            });
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10,right: 10),
            height: MediaQuery.of(context).size.height/15,
            color:HexColor("#9adee8"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Center(
                  child: Text(widget.date??"",style: const TextStyle(color: Colors.white,fontSize: 20),),

                ),
                widget.isShow?widget.minimizeIcon?? const Icon(Icons.keyboard_arrow_down,size: 40,):const Icon(Icons.keyboard_arrow_up,size: 40,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
