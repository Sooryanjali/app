// ignore: file_names
import 'package:flutter/material.dart';
import 'package:loginfire/styles/colors.dart';
import 'package:loginfire/styles/styles.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Center(child: (Text('Schedule Tab'))),
      ),
    );
  }
}
