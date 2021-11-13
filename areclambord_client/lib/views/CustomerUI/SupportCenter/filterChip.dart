// import 'package:flutter/material.dart';
// import 'package:areclambord_client/views/CustomerUI/SupportCenter/submitTicket.dart';

// class SingleFilterChip extends StatefulWidget {
//   const SingleFilterChip({Key? key, required this.chipName, required this.mainKey}) : super(key: key);
//   final String chipName;
//   final GlobalKey<_SubmitTicketScreenState> mainKey;
//   @override
//   _SingleFilterChipState createState() => _SingleFilterChipState();
// }

// class _SingleFilterChipState extends State<SingleFilterChip> {
//   // final _submitTicketScaffoldKey = GlobalKey<ScaffoldState>();
//   var _isSelected = false;
//   late GlobalKey<_SubmitTicketScreenState> submitTicketScaffoldKey  = GlobalKey<_SubmitTicketScreenState>();
//   @override
//   void initState(){
//     submitTicketScaffoldKey = widget.mainKey;
//     _Submit;
//   }

  

//    @override
//   Widget build(BuildContext context) {
//     return FilterChip(
//       label: Text(widget.chipName), 
//       labelStyle: TextStyle(color: Colors.purple[700], fontSize: 15, fontWeight: FontWeight.bold),
//       backgroundColor: Colors.yellow[400],
//       selectedColor: Colors.pink[400],
//       selected: _isSelected,
//       onSelected: (isSelected){
//         setState(() {
//           _isSelected = isSelected;
//         });
//         submitTicketScaffoldKey.currentState?.setText("Disgital");
//       }
//     );
//   }

// }