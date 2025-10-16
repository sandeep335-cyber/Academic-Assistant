import 'package:flutter/material.dart';
import 'package:projects/constants/theme.dart';

class GradesCard extends StatelessWidget {
  const GradesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : AppTheme.darkBg;

    return Card(
      color: isDark ? Colors.blueGrey[800] : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: SizedBox(
        height: 140,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          leading: Icon(Icons.school, color: theme.colorScheme.secondary, size: 44),
          title: Text(
            "Last Semester Results",
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          subtitle: Text(
            "📚 Grade: 9.5, Credits: 21\nOverall Grade: 9.2\nTotal Credits: 84",
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: textColor.withOpacity(0.85),
            ),
          ),
        ),
      ),
    );
  }
}
