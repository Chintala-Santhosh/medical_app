import 'package:flutter/material.dart';

class BodyScreen extends StatefulWidget {
  final String? name;
  final String? date;
  final Icon? minimizeIcon;
  final Icon? dropdownIcon;
  const BodyScreen({Key? key,this.name,this.date,this.minimizeIcon, this.dropdownIcon}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 20),
          height: 50,
          color: Colors.blueAccent.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Center(
                    child: Text("${widget.name??""}"),

                  ),
                  const SizedBox(width: 110,),
                  widget.minimizeIcon??const Icon(Icons.zoom_in_map_sharp),

                ],


              ),

            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10,right: 20),
          height: 50,
          color: Colors.blueAccent.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Center(
                child: Text("${widget.date??""}"),

              ),
              widget.minimizeIcon??const Icon(Icons.keyboard_arrow_down,size: 30,),
            ],
          ),
        ),
      ],
    );
  }
}
