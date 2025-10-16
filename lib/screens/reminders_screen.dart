import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> todayReminders = [
      "Submit Academic Assistant project by 12:40 PM",
      "Attend drive at 1:40 PM",
      "Upload the assignments in LMS portal",
      "Correct the records before internal",
    ];

    final List<String> tomorrowSchedule = [
      "Lecture on Types of Geothermal Resources",
      "Submit IRS assignment",
      "Submit OS assignment",
      "Make summary notes for NPTEL examination",
      "Submit the flutter project in LMS portal",
      "Print outputs for the Tinkering Lab Record",
    ];

    Widget buildReminderCard(String text) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          leading: Icon(Icons.alarm,
              color: Theme.of(context).colorScheme.secondary),
          title: Text(text, style: const TextStyle(fontSize: 15)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminders"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Reminders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...todayReminders.map(buildReminderCard),

              const SizedBox(height: 24),
              const Text(
                "Tomorrow's Schedule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...tomorrowSchedule.map(buildReminderCard),
            ],
          ),
        ),
      ),
    );
  }
}
