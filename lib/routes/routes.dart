import 'dart:js';

import 'package:flutter/material.dart';
import 'package:loginfire/screens/doctor_detail.dart';
import 'package:loginfire/screens/home.dart';
//import 'package:loginfire/screens/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //'/login': (context) => Login(),
  '/home':(context)=>Home(),
  '/detail': (context) => SliverDoctorDetail(),
};