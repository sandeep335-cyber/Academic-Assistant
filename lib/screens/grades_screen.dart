import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final List<Map<String, String>> semesters = [
      {"semester": "Semester 1", "grade": "9.2", "credits": "20"},
      {"semester": "Semester 2", "grade": "9.4", "credits": "21"},
      {"semester": "Semester 3", "grade": "9.3", "credits": "22"},
      {"semester": "Semester 4", "grade": "9.5", "credits": "21"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Grades"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: semesters.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final sem = semesters[index];
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
                      sem["semester"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Grade: ${sem["grade"]}, Credits: ${sem["credits"]}",
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
