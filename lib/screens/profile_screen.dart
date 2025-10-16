import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final VoidCallback onLogout;
  final String username;
  const ProfileScreen(
      {super.key,
        required this.onThemeToggle,
        required this.onLogout,
        required this.username});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  child: Text(
                    username.isNotEmpty ? username[0].toUpperCase() : 'S',
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  username,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${username.toLowerCase().replaceAll(' ', '')}@vishnu.edu.in',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            Card(
              child: Column(
                children: [
                  _buildProfileOption(
                    context,
                    icon: Icons.person_outline,
                    title: 'My Account',
                    onTap: () {},
                  ),
                  const Divider(height: 5),
                  ListTile(
                    leading: Icon(
                        isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: Text('Theme', style: const TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Switch(
                      value: isDark,
                      onChanged: (value) => onThemeToggle(),
                    ),
                  ),
                  const Divider(height: 5),
                  _buildProfileOption(
                    context,
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  const Divider(height: 5),
                  _buildProfileOption(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    color: Colors.redAccent,
                    onTap: onLogout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context,
      {required IconData icon,
        required String title,
        required VoidCallback onTap,
        Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? Theme.of(context).colorScheme.secondary),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500, color: color)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
      onTap: onTap,
    );
  }
}