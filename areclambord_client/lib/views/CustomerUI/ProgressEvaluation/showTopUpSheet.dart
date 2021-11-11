import 'package:flutter/material.dart';

import 'sheetButton.dart';

class ShowTopUpSheet extends StatefulWidget {
  const ShowTopUpSheet({Key? key}) : super(key: key);

  @override
  _ShowTopUpSheetState createState() => _ShowTopUpSheetState();

}

class _ShowTopUpSheetState extends State<ShowTopUpSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
              // margin: EdgeInsets.only(left: 50, right: 50),
              height: 350,
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // paymentDetailsCard(context)
                  Container(
                    height: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      // boxShadow: [
                      //   BoxShadow(blurRadius: 10, color: Colors.grey[400], spreadRadius: 8)
                      // ]
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 50, right: 50),
                              child: Text(
                                "Payment Details for TopUp Advertisement:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 120, right: 120),
                          child: Form(
                              key: _paymentFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  cardNumber,
                                  expDate,
                                  cvc,
                                  const SizedBox(
                                    height: 2.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SheetButton(),
                                      maintainSameButton(context),                                
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
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
    decoration: const InputDecoration(labelText: "Expiry date", hintText: "MM/YY"),
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
