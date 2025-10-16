import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, Object>> todaySchedule = [
      {
        'title': 'Information Retrieval Systems',
        'time': '9:00 - 09:50 AM',
        'room': 'Classroom',
        'icon': Icons.check_circle,
        'color': Colors.green,
      },
      {
        'title': 'Tinkering Lab',
        'time': '9:50 - 12:40 PM',
        'room': 'Software Lab-1',
        'icon': Icons.play_circle_fill,
        'color': theme.colorScheme.secondary,
      },
      {
        'title': 'Operating Systems',
        'time': '1:40 - 2:30 PM',
        'room': 'Classroom',
        'icon': Icons.access_time,
        'color': Colors.grey,
      },
      {
        'title': 'CRT Classes',
        'time': '2:30 - 5:00 PM',
        'room': 'Center Of Excellence',
        'icon': Icons.access_time,
        'color': Colors.grey,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Timetable"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todaySchedule.length,
        itemBuilder: (context, index) {
          final item = todaySchedule[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Icon(
                item['icon'] as IconData,
                color: item['color'] as Color,
                size: 28,
              ),
              title: Text(
                item['title'] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${item['time']} • ${item['room']}',
                style: theme.textTheme.bodySmall,
              ),
            ),
          );
        },
      ),
    );
  }
}
