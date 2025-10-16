import 'package:flutter/material.dart';

class AddReminderScreen extends StatelessWidget {
  const AddReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Reminder"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.alarm_add, size: 80, color: Theme.of(context).colorScheme.primary),
              SizedBox(height: 20),
              Text(
                "Here you can add reminders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add Reminder"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
