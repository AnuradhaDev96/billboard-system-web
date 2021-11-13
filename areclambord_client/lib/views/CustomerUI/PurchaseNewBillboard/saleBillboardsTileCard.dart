import 'package:flutter/material.dart';

// import 'sheetButton.dart';

class SaleBillboardsTileCard extends StatefulWidget {
  const SaleBillboardsTileCard({Key? key}) : super(key: key);

  @override
  _SaleBillboardsTileCardState createState() => _SaleBillboardsTileCardState();
}

class _SaleBillboardsTileCardState extends State<SaleBillboardsTileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 50, right: 50),
      height: 100,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      // color: Colors.white,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // paymentDetailsCard(context)
          Positioned(
            left: 100,
            right: 100,
            child: Container(
              // height: 320,
              // constraints: BoxConstraints(maxWidth),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(15),
                // boxShadow: [
                //   BoxShadow(blurRadius: 10, color: Colors.grey[400], spreadRadius: 8)
                // ]
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Purchase Made By: ",                        
                        style: TextStyle(color: Colors.black ,fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )                    
                  
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  static TextEditingController cardNumberController = TextEditingController();
  static TextEditingController expDateController = TextEditingController();
  static TextEditingController cvcController = TextEditingController();

  final _paymentFormKey = GlobalKey<FormState>();

  final cardNumber = TextFormField(
    controller: cardNumberController,
    decoration: const InputDecoration(
        labelText: "Credit/Debit Card Number", hintText: "XXXX-XXXX-XXXX-XXXX"),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Card Number cannot be empty';
      }
      return null;
    },
  );

  final expDate = TextFormField(
    controller: expDateController,
    decoration:
        const InputDecoration(labelText: "Expiry date", hintText: "MM/YY"),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Expiry date cannot be empty!';
      }
      return null;
    },
  );

  final cvc = TextFormField(
    controller: cvcController,
    decoration: const InputDecoration(labelText: "CVC", hintText: "XXX"),
    validator: (value) {
      if (value!.isEmpty) {
        return 'CVC cannot be empty!';
      }
      return null;
    },
  );

  // confirmTopUpButton() {
  //   return Padding(
  //     padding: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
  //     child: MaterialButton(
  //         minWidth: 250,
  //         height: 40,
  //         elevation: 5,
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.0)),
  //         color: Colors.orange[400],
  //         child: Text(
  //           "Confirm TopUp Payment",
  //           style: TextStyle(fontSize: 15.0, color: Colors.white),
  //         ),
  //         onPressed: () {
  //           if (_paymentFormKey.currentState.validate()) {
  //             //addMall();
  //             // buyBillboardVacancy();
  //           }
  //         }),
  //   );
  // }

  maintainSameButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      child: MaterialButton(
          minWidth: 250,
          height: 40,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.0)),
          color: Colors.black,
          child: const Text(
            "Maintain the Advertisment",
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
