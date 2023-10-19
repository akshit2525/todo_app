import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_route.dart';

void main(){
  runApp(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: screenroute,
      )
  );
}