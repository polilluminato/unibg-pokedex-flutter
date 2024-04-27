import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getScreenWidth(BuildContext context) {
  return getScreenSize(context).width;
}

double getScreenHeight(BuildContext context) {
  return getScreenSize(context).height;
}
