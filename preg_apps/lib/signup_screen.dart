import 'package:flutter/material.dart';
import 'package:preg_apps/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  String? _selectedLocation; // New variable to store the selected location

  final List<String> _locations = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix'
  ]; // List of locations

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Perform sign-up logic here (e.g., API call)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signing up...')),
      );
    }
  }

  void _goToLogin() {
    // Logic to navigate to the login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildCustomTextField(
                controller: _nameController,
                labelText: 'Full Name',
                validatorMessage: 'Please enter your name',
              ),
              SizedBox(height: 10),
              _buildCustomTextField(
                controller: _dobController,
                labelText: 'Date Of Birth',
                validatorMessage: 'Please enter your date of birth',
              ),
              SizedBox(height: 10),
              _buildLocationDropdown(), // Use the new dropdown method for location
              SizedBox(height: 10),
              _buildCustomTextField(
                controller: _phoneController,
                labelText: 'Phone Number',
                validatorMessage: 'Please enter your phone number',
              ),
              SizedBox(height: 10),
              _buildCustomTextField(
                controller: _usernameController,
                labelText: 'User Name',
                validatorMessage: 'Please enter your user name',
              ),
              SizedBox(height: 10),
              _buildCustomTextField(
                controller: _emailController,
                labelText: 'Email',
                validatorMessage: 'Please enter your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildCustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                validatorMessage: 'Please enter your password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the SignUpScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the SignUpScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String labelText,
    required String validatorMessage,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      height: 60, // Set height
      decoration: BoxDecoration(
        color: Color(0x8CFB1F6E), // Set background color
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20), // Padding inside the field
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return validatorMessage;
              }
              return null;
            },
      ),
    );
  }

  Widget _buildLocationDropdown() {
    return Container(
      height: 60, // Same height as other fields
      decoration: BoxDecoration(
        color: Color(0x8CFB1F6E), // Same background color
        borderRadius: BorderRadius.circular(15), // Same rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 20), // Padding inside the field
      child: DropdownButtonFormField<String>(
        value: _selectedLocation,
        decoration: InputDecoration(
          border: InputBorder.none, // Remove the default underline
        ),
        items: _locations.map((location) {
          return DropdownMenuItem<String>(
            value: location,
            child: Text(location),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedLocation = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a location';
          }
          return null;
        },
        hint: Text('Select Location'),
      ),
    );
  }
}
