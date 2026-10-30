
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // Form validation key
  final _formKey = GlobalKey<FormState>();

  // Password visibility
  bool _obscurePassword = true;

  // Validate and submit the form
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // PART 1 - Username
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Username is required';
                    }
                    if (value.trim().length < 3) {
                      return 'Minimum 3 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // PART 2 - Email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // PART 3 - Password with visibility toggle
                TextFormField(
                  obscureText: _obscurePassword,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Minimum 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                // PART 4 - Submit button
                ElevatedButton(
                  onPressed: submitForm,
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
