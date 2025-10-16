import 'package:flutter/material.dart';

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = ["Information Retrieval Systems", "Computer Networks", "Operating Systems", "Exploratory Data Analysis", "Open Elective", "Tinkering Lab", "Information Retrieval Lab", "Computer Networks Lab", "Full Stack Development Lab", "NPTEL",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Syllabus")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(
                subject,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
