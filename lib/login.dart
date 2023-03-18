// Lab 7 Task 1 - Create a login screen
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
          children: [
            Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 200,
                  width: 200,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    filled: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_passwordVisible,
                  validator: (value) {
                    if (!validatePassword(value!)) {
                      return 'Password must have at least 8 characters, one uppercase letter, one special character, and one number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    const Text('Remember me'),
                    const Spacer(),
                    const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                const SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/home');

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Login successful'),
                      //     duration: Duration(seconds: 2),
                      //   ),
                      // );
                    }
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// password validation
  bool validatePassword(String password) {
    if (password.isEmpty) {
      return false;
    }

    if (password.length < 8) {
      return false;
    }

    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    if (!uppercaseRegex.hasMatch(password)) {
      return false;
    }

    RegExp specialCharRegex = RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]');
    if (!specialCharRegex.hasMatch(password)) {
      return false;
    }

    RegExp numberRegex = RegExp(r'[0-9]');
    if (!numberRegex.hasMatch(password)) {
      return false;
    }

    return true;
  }
}
