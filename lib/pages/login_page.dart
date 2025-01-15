import 'package:flutter/material.dart';
import 'package:summit_gate/models/square_tile.dart';
import 'package:summit_gate/pages/home_page.dart';
import 'package:summit_gate/components/my_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> login(String email, String password) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final url = Uri.parse('https://reqres.in/api/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        print('Login successful: $token');
        // Redirect to the next page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        final errorData = json.decode(response.body);
        setState(() {
          _errorMessage = errorData['error'];
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again later.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
            child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(250, 249, 133, 9),
                const Color.fromARGB(255, 247, 178, 51),
              ],
            ),
          ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const SizedBox(height: 50),
                // Logo
                const Icon(
                  Icons.lock,
                  size: 100,
                  color: Color.fromARGB(255, 9, 2, 35),
                ),
              
                const SizedBox(height: 50),
              
                // Welcome back, you've been missed
                Text(
                  "Welcome back you\'ve been missed",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              
                const SizedBox(height: 20),
              
                // username textfield
                MyTextfield(
                  controller: _emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
              
                const SizedBox(
                  height: 10,
                ),
              
                // password textfield
                MyTextfield(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
              
                const SizedBox(
                  height: 10,
                ),
              
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              
                const SizedBox(
                  height: 20,
                ),
              
                // Sign in button
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  GestureDetector(
                    onTap: () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();
                      if (email.isNotEmpty && password.isNotEmpty) {
                        login(email, password);
                      } else {
                        setState(() {
                          _errorMessage = 'Please fill in all fields';
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 9, 2, 35),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(25),
                        child: Center(
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_errorMessage != null) ...[
                  SizedBox(height: 20),
                  Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              
                const SizedBox(
                  height: 50,
                ),
              
                // or sign up with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: const Color.fromARGB(251, 249, 145, 9),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: const Color.fromARGB(251, 249, 145, 9),
                        ),
                      ),
                    ],
                  ),
                ),
              
                const SizedBox(
                  height: 50,
                ),
              
                // google sign in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: "assets/Google__G_logo.png")
                  ],
                ),
              
                const SizedBox(
                  height: 50,
                ),
              
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      );
  }
}
