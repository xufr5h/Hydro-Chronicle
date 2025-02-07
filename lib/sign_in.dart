import "package:flutter/material.dart";
import 'package:hydro_chronicle/home_page.dart';
import 'package:hydro_chronicle/sign_up.dart';
import 'components/textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            alignment: const Alignment(0.0, 0.0),
            child: Image.asset(
              'assets/images/crown_logo.png',
              height: 150,
              width: 150,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75),
              ),
              color: Color.fromARGB(255, 177, 215, 245),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Itim',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Textfield(
                  controller: _emailController,
                  label: 'Email',
                ),
                const SizedBox(height: 20),
                Textfield(
                  controller: _passwordController,
                  label: 'Password',
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 42),
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
                          'Remember me',
                          style: TextStyle(fontSize: 18, fontFamily: 'Itim'),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 140),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Itim',
                            color: Color.fromARGB(255, 44, 72, 209),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 24, fontFamily: 'Itim', color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 67, 92, 218),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Itim',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Itim',
                          color: Color.fromARGB(255, 44, 72, 209),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
