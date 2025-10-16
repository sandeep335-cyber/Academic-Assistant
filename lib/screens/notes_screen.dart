import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final notes = [
      {"title": "Information Retrieval Systems", "updated": "Oct 14, 2025"},
      {"title": "Computer Networks", "updated": "Oct 12, 2025"},
      {"title": "Operating Systems", "updated": "Oct 10, 2025"},
      {"title": "Exploratory Data Analysis", "updated": "Oct 14, 2025"},
      {"title": "Open Elective", "updated": "Oct 12, 2025"},
      {"title": "Tinkering Lab", "updated": "Oct 10, 2025"},
      {"title": "Information Retrieval Lab", "updated": "Oct 14, 2025"},
      {"title": "Computer Networks Lab", "updated": "Oct 12, 2025"},
      {"title": "Full Stack Development Lab", "updated": "Oct 10, 2025"},
      {"title": "NPTEL", "updated": "Oct 15, 2025"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notes.length,
        separatorBuilder: (_, _) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              title: Text(
                note['title']!,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Last updated on ${note['updated']}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
