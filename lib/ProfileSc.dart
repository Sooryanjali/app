import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileSc extends StatefulWidget {
  const ProfileSc({super.key});

  @override
  State<ProfileSc> createState() => _ProfileScState();
}

class _ProfileScState extends State<ProfileSc> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Logged in"),
      ),
    );
  }
}