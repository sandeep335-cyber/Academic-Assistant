import 'package:flutter/material.dart';

class AcademicModule {
  final String name;
  final int totalItems;
  final String thumbnail;
  final String route;

  AcademicModule({
    required this.name,
    required this.totalItems,
    required this.thumbnail,
    required this.route,
  });
}

final List<AcademicModule> academicModules = [
  AcademicModule(
    name: "Notes",
    totalItems: 10,
    thumbnail: "assets/icons/notes_icon.jpg",
    route: "/notes",
  ),
  AcademicModule(
    name: "Attendance",
    totalItems: 4,
    thumbnail: "assets/icons/attendance_icon.jpg",
    route: "/attendance",
  ),
  AcademicModule(
    name: "Syllabus",
    totalItems: 10,
    thumbnail: "assets/icons/syllabus_icon.jpg",
    route: "/syllabus",
  ),
  AcademicModule(
    name: "Assignments",
    totalItems: 0,
    thumbnail: "assets/icons/assignments_icon.jpg",
    route: "/assignments",
  ),
  AcademicModule(
    name: "Calendar",
    totalItems: 0,
    thumbnail: "assets/icons/calendar_icon.jpg",
    route: "/calendar",
  ),
  AcademicModule(
    name: "Grades",
    totalItems: 4,
    thumbnail: "assets/icons/grades_icon.jpg",
    route: "/grades",
  ),
  AcademicModule(
    name: "Reminders",
    totalItems: 10,
    thumbnail: "assets/icons/reminders_icon.jpg",
    route: "/reminders",
  ),
  AcademicModule(
    name: "Resources",
    totalItems: 0,
    thumbnail: "assets/icons/resources_icon.jpg",
    route: "/resources",
  ),
];

class ModuleCard extends StatelessWidget {
  final AcademicModule module;
  const ModuleCard({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.pushNamed(context, module.route);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.15),
                child: Icon(
                  _getModuleIcon(module.name),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const Spacer(),
              Text(
                module.name,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "${module.totalItems} items",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getModuleIcon(String name) {
    switch (name.toLowerCase()) {
      case 'notes':
        return Icons.note_alt;
      case 'attendance':
        return Icons.how_to_reg;
      case 'syllabus':
        return Icons.menu_book;
      case 'assignments':
        return Icons.assignment;
      case 'calendar':
        return Icons.calendar_today;
      case 'grades':
        return Icons.grade;
      case 'reminders':
        return Icons.alarm;
      case 'resources':
        return Icons.folder_open;
      default:
        return Icons.school;
    }
  }
}
