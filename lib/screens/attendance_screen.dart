import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final List<Map<String, String>> subjects = [
      {"title": "Semester - 1", "attended": "376", "held": "513", "percentage": "73.29%"},
      {"title": "Semester - 2", "attended": "390", "held": "510", "percentage": "76.71%"},
      {"title": "Semester - 3", "attended": "380", "held": "494", "percentage": "76.92%"},
      {"title": "Semester - 4", "attended": "412", "held": "470", "percentage": "86.91%"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: subjects.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final sub = subjects[index];
            return Card(
              color: isDark ? Colors.blueGrey[800] : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sub["title"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Attended: ${sub["attended"]}\nHeld: ${sub["held"]}\nPercentage: ${sub["percentage"]}",
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
