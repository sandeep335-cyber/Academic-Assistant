import 'package:flutter/material.dart';
import 'package:projects/constants/theme.dart';
import 'package:projects/screens/bottom_nav_bar.dart';
import 'package:projects/screens/login_screen.dart';
import 'package:projects/screens/notes_screen.dart';
import 'package:projects/screens/attendance_screen.dart';
import 'package:projects/screens/syllabus_screen.dart';
import 'package:projects/screens/assignments_screen.dart';
import 'package:projects/screens/calendar_screen.dart';
import 'package:projects/screens/grades_screen.dart';
import 'package:projects/screens/resources_screen.dart';
import 'package:projects/screens/reminders_screen.dart';

void main() {
  runApp(const AcademicAssistant());
}

class AcademicAssistant extends StatefulWidget {
  const AcademicAssistant({super.key});

  @override
  State<AcademicAssistant> createState() => _AcademicAssistantState();
}

class _AcademicAssistantState extends State<AcademicAssistant> {
  ThemeMode _themeMode = ThemeMode.light;
  bool _isLoggedIn = false;
  String _username = '';

  void _toggleTheme() {
    setState(() {
      _themeMode =
      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _onLoginSuccess(String username) {
    setState(() {
      _isLoggedIn = true;
      _username = username;
    });
  }

  void _onLogout() {
    setState(() {
      _isLoggedIn = false;
      _username = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academic Assistant',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: _isLoggedIn
          ? BottomNavBar(
        onThemeToggle: _toggleTheme,
        onLogout: _onLogout,
        username: _username,
      )
          : LoginScreen(onLoginSuccess: _onLoginSuccess),

      routes: {
        '/notes': (context) => const NotesScreen(),
        '/attendance': (context) => const AttendanceScreen(),
        '/syllabus': (context) => const SyllabusScreen(),
        '/assignments': (context) => const AssignmentsScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/grades': (context) => const GradesScreen(),
        '/reminders': (context) => const RemindersScreen(),
        '/resources': (context) => const ResourcesScreen(),
      },
    );
  }
}
