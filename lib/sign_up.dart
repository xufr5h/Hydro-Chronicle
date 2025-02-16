import "package:flutter/material.dart";
import 'package:hydro_chronicle/components/textfield.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(255, 217, 235, 254),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/crown_logo.png',
                height: 150,
                width: 150,
              ),
            ),
          ),
          Expanded(
              flex: 8,
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
                    const SizedBox(height: 30),
                    Textfield(
                      controller: _usernameController,
                      label: 'Username',
                      obscureText: false,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
