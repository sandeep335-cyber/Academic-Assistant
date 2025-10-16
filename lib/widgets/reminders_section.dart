import 'package:flutter/material.dart';

class RemindersSection extends StatelessWidget {
  final List<String> reminders;
  const RemindersSection(
      {super.key,
        this.reminders = const [
          "Submit Academic Assistant project by 12:40 PM",
          "Attend drive at 1:40 PM",
          "Upload the assignments in LMS portal",
          "Correct the records before internal"
        ]});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reminders
          .map((reminder) => Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          leading:
          Icon(Icons.alarm, color: Theme.of(context).colorScheme.secondary),
          title: Text(reminder, style: TextStyle(fontSize: 15)),
        ),
      )).toList(),
    );
  }
}