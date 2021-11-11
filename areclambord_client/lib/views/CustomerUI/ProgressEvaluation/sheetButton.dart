import 'package:flutter/material.dart';

class SheetButton extends StatefulWidget {
  SheetButton({Key? key}) : super(key: key);

  _SheetButtonState createState() => _SheetButtonState();
}

class _SheetButtonState extends State<SheetButton> {
  bool checkingFlight = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return checkingFlight == false
        ? Padding(
          padding: const EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
          child: MaterialButton(
              minWidth: 250,
              height: 40,
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.0)),
              color: Colors.orange[400],
              onPressed: () async {
                setState(() {
                 checkingFlight = true; 
                });

                await Future.delayed(const Duration(seconds:1));

                setState(() {
                 success = true; 
                });

                await Future.delayed(const Duration(milliseconds: 1500));

                Navigator.pop(context);
              },
              child: const Text(         
                'Confirm TopUp Payment',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
        )
        : success == false
            ? const CircularProgressIndicator()
            : const Icon(
                Icons.check,
                color: Colors.green,
              );
  }
}