import 'package:flutter/material.dart';
import 'package:projects/widgets/academic_module.dart';
import 'package:projects/widgets/grades_card.dart';
import 'package:projects/widgets/quick_actions_bar.dart';
import 'package:projects/widgets/reminders_section.dart';
import 'package:projects/widgets/search_textfield.dart';
import 'notifications_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String username;
  const DashboardScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${username.split(' ').first}!"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.blueGrey,
            ),
            tooltip: 'Notifications',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's make today productive.",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              const SearchTextField(),
              const SizedBox(height: 24),
              const QuickActionsBar(),
              const SizedBox(height: 24),

              _buildSectionHeader(context, "Academic Modules"),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: academicModules.length,
                itemBuilder: (context, index) {
                  return ModuleCard(module: academicModules[index]);
                },
              ),

              const SizedBox(height: 24),

              const GradesCard(),
              const SizedBox(height: 24),

              _buildSectionHeader(context, "Reminders"),
              const RemindersSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "See All",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
