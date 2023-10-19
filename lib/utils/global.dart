import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class Global {
  static Global g1 =Global();
  List<TodoModel> TodoList = [];
}