import "package:flutter/material.dart";
import 'package:hydro_chronicle/components/textfield.dart';
import 'package:hydro_chronicle/home_page.dart';

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
  bool checkBoxValue = false;
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
                          activeColor: const Color.fromARGB(255, 67, 92, 218),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 67, 92, 218),
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
                          Navigator.pop(context);
                        },
                        child: const Text(
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
        ],
      ),
    );
  }
}
