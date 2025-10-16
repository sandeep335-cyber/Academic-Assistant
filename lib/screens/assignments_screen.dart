import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignments"),
      ),
      body: Center(
        child: Text("No assignments attached yet!"),
      ),
    );
  }
}
