import 'package:flutter/cupertino.dart';

class BounceInCenterPageRoute extends PageRouteBuilder {
  final Widget widget;

  BounceInCenterPageRoute({required this.widget})
  :super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
      animation = CurvedAnimation(parent: animation, curve: Curves.elasticOut);

      return ScaleTransition(
        scale: animation,
        alignment: Alignment.center,
        child: child,
        );
    },
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
      return widget;
    }
  );

}