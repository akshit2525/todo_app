import 'package:flutter/cupertino.dart';
import 'package:todo_app/screen/data_screen.dart';
import 'package:todo_app/screen/home_screen.dart';

Map<String , WidgetBuilder >screenroute = {
  '/' : (context) => HomeScreen(),
  'data' : (context) => DataScreen(),
};