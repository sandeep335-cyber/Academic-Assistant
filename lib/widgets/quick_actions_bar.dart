import 'package:flutter/material.dart';
import 'package:projects/screens/add_event_screen.dart';
import 'package:projects/screens/add_note_screen.dart';
import 'package:projects/screens/add_reminder_screen.dart';
import 'package:projects/screens/add_upload_screen.dart';

class QuickActionsBar extends StatelessWidget {
  const QuickActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _quickActionButton(context, Icons.event, "Add Event", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEventScreen()),
          );
        }),
        _quickActionButton(context, Icons.note_add_outlined, "Add Note", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNoteScreen()),
          );
        }),
        _quickActionButton(context, Icons.alarm_add, "Reminder", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddReminderScreen()),
          );
        }),
        _quickActionButton(context, Icons.upload_file, "Upload", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUploadScreen()),
          );
        }),
      ],
    );
  }

  Widget _quickActionButton(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.15),
            child: Icon(
              icon,
              size: 28,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}