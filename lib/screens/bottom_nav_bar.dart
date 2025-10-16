import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'notes_screen.dart';
import 'timetable_screen.dart';
import 'profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final VoidCallback onLogout;
  final String username;

  const BottomNavBar(
      {super.key,
        required this.onThemeToggle,
        required this.onLogout,
        required this.username});

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      DashboardScreen(username: widget.username),
      const NotesScreen(),
      const TimetableScreen(),
      ProfileScreen(
        onThemeToggle: widget.onThemeToggle,
        onLogout: widget.onLogout,
        username: widget.username,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            activeIcon: Icon(Icons.note_alt),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_outlined),
            activeIcon: Icon(Icons.schedule),
            label: "Timetable",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}