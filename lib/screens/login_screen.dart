import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function(String) onLoginSuccess;
  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Password required';
    if (value.length < 8) return 'At least 8 characters';
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) return 'At least one special symbol';
    if (!RegExp(r'\d').hasMatch(value)) return 'At least one digit';
    return null;
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate() && _usernameController.text.isNotEmpty) {
      widget.onLoginSuccess(_usernameController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enter valid username and password!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width < 400
        ? MediaQuery.of(context).size.width * 0.9
        : 400.0;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, size: 70, color: Theme.of(context).primaryColor),
                  SizedBox(height: 30),
                  Text("Welcome Back",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                  SizedBox(height: 8),
                  Text("Enter your credentials to login",
                      style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                  SizedBox(height: 32),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.secondary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter username' : null,
                  ),
                  SizedBox(height: 18),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Theme.of(context).colorScheme.secondary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    validator: passwordValidator,
                  ),
                  SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 18),
                  TextButton(onPressed: () {}, child: Text("Forgot Password?")),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(onPressed: () {}, child: Text("Sign Up")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
