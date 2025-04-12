import "package:flutter/material.dart";
import 'package:hydro_chronicle/components/textfield.dart';
import 'package:hydro_chronicle/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hydro_chronicle/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController =
    TextEditingController();

class _SignUpState extends State<SignUp> {
  firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
  bool checkBoxValue = false;
  bool circular = false;
  String? errorMessage;

  Future<void> register() async {
    setState(() {
      errorMessage = null;
    });
    if (!checkBoxValue) {
      setState(() {
        errorMessage = 'Please agree to the terms and conditions';
      });
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }
    setState(() {
      circular = true;
    });
    try {
      firebase_auth.UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User signed up: ${userCredential.user!.email}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User signed up successfully')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignIn()));
      // error handling
    } catch (e) {
      String errorText = "Error during sign up: ${e.toString()}";
      if (e is firebase_auth.FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            errorText = 'Email already in use. Please use a different email.';
            break;
          case 'invalid-email':
            errorText = 'Invalid email address. Please enter a valid email.';
            break;
          case 'weak-password':
            errorText = 'Weak password. Please enter a stronger password.';
            break;
          default:
            errorText = "Error : ${e.message}";
        }
      }
      setState(() {
        errorMessage = errorText;
      });
    }
    setState(() {
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/crown_logo.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                ),
                color: Color.fromARGB(255, 177, 218, 245),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Itim',
                            color: Color.fromARGB(255, 63, 62, 62),
                          ),
                        ),
                      ),
                      // Username textfield
                      const SizedBox(height: 30),
                      Textfield(
                        controller: _usernameController,
                        label: 'Username',
                        obscureText: false,
                      ),
                      //Email textfield
                      const SizedBox(height: 10),
                      Textfield(
                        controller: _emailController,
                        label: 'Email',
                        obscureText: false,
                      ),
                      // Password textfield
                      const SizedBox(height: 10),
                      Textfield(
                          controller: _passwordController,
                          label: 'Password',
                          obscureText: true),
                      //Confirm Password
                      const SizedBox(height: 10),
                      Textfield(
                          controller: _confirmPasswordController,
                          label: 'Confirm Password',
                          obscureText: true),
                      // terms and conditions
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              value: checkBoxValue,
                              activeColor:
                                  const Color.fromARGB(255, 67, 92, 218),
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkBoxValue = newValue!;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'I agree to the',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Itim',
                              color: Color.fromARGB(255, 63, 62, 62),
                            ),
                          ),
                          const Text(
                            ' Terms and Conditions',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Itim',
                              color: Color.fromARGB(255, 107, 44, 44),
                            ),
                          ),
                        ],
                      ),
                      // error message display
                      if (errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontFamily: 'Itim',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      // button
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 67, 92, 218),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Itim',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Itim',
                              color: Color.fromARGB(255, 63, 62, 62),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()));
                            },
                            child: circular
                                ? const CircularProgressIndicator()
                                : const Text(
                                    ' Sign In',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Itim',
                                      color: Color.fromARGB(255, 44, 72, 209),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
