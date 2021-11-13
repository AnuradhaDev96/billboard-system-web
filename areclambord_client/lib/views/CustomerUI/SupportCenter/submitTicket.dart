import 'package:areclambord_client/views/CustomerUI/SupportCenter/filterChip.dart';
import 'package:flutter/material.dart';

class SubmitTicketScreen extends StatefulWidget {
  const SubmitTicketScreen({Key? key}) : super(key: key);
  

  @override
  _SubmitTicketScreenState createState() => _SubmitTicketScreenState();
}

class _SubmitTicketScreenState extends State<SubmitTicketScreen> {
  // final _submitTicketScaffoldKey  = GlobalKey<ScaffoldState>();
  // static String selectedType = "Not Selected";

  // void setText(String s){
  //   setState(() {
  //     selectedType = s;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _submitTicketScaffoldKey,
      backgroundColor: Colors.yellow[600],
      // key: _submitTicketScaffoldKey,
      // width: double.infinity,
      // backgroundColor: Colors.cyan,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Positioned(
              //   left: 10,
              // right: 50,
              // child:
              Container(
                width: 400,
                height: MediaQuery.of(context).size.height,
                // alignment: Alignment.centerLeft,
                // constraints: const BoxConstraints(maxWidth: 50, maxHeight: 600),
                // width: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                ),
              ),
              // ),
              // Positioned(
              // left: 250,
              // right: 10,
              // width: 100,
              // height: 100,
              // child:
              Padding(
                padding: const EdgeInsets.only(right: 10,),
                child: Container(
                  // alignment: Alignment.centerLeft,
                  // constraints: const BoxConstraints(maxWidth: 200, maxHeight: 600),
                  // width: 200,
                  width: 580,
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: const <Widget>[                      
                      SingleFilterChip(chipName: "Digital"),
                      SingleFilterChip(chipName: "Large"),
                    ],
                  ),
                ),
              )
              // ),
            ],
          ),
          Positioned(
            left: 430,
            top: 50,
            child: Container(
              // alignment: Alignment.centerLeft,
              // constraints: const BoxConstraints(maxWidth: 200, maxHeight: 600),
              // width: 200,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(80.0),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 1,
                        color: Color(0xFFD6D6D6),
                        offset: Offset(5, 5))
                  ]),
            ),
          ),
          // Positioned(
          //   child: Text(
          //     selectedType,
          //     style: const TextStyle(fontSize: 20.0, color: Colors.white),
          //   )
          // )
          // Positioned(
          //   top: 80,
          //   right: 50,
          //   child: Container(
          //     width: 620,
          //     height: 650,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20.0)),
          //   ),
          // )
        ],
      ),
    );
  }
}









class SingleFilterChip extends StatefulWidget {
  const SingleFilterChip({Key? key, required this.chipName}) : super(key: key);
  final String chipName;
  // final GlobalKey<_SubmitTicketScreenState> mainKey;
  @override
  _SingleFilterChipState createState() => _SingleFilterChipState();
}

class _SingleFilterChipState extends State<SingleFilterChip> {
  // final _submitTicketScaffoldKey = GlobalKey<ScaffoldState>();
  var _isSelected = false;
  late GlobalKey<_SubmitTicketScreenState> submitTicketScaffoldKey  = GlobalKey<_SubmitTicketScreenState>();
  // @override
  // void initState(){
  //   submitTicketScaffoldKey = widget.mainKey;
  // }  

   @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName), 
      labelStyle: TextStyle(color: Colors.purple[700], fontSize: 15, fontWeight: FontWeight.bold),
      backgroundColor: Colors.yellow[400],
      // selectedColor: Colors.pink[400],
      selected: _isSelected,
      onSelected: (isSelected){
        setState(() {
          _isSelected = isSelected;
        });
        // submitTicketScaffoldKey.currentState?.setText("Disgital");
      }
    );
  }

}

