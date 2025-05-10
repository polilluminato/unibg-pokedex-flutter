import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:

            /*Image.asset(
        "assets/loading/rainbow-circle.gif",
        fit: BoxFit.contain,
        width: getScreenWidth(context) * .5,
        height: getScreenWidth(context) * .5,
      ),*/
            CircularProgressIndicator());
  }
}
