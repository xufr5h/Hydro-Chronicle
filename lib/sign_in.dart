import "package:flutter/material.dart";
import 'package:hydro_chronicle/home_page.dart';
import 'package:hydro_chronicle/sign_up.dart';
import 'components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
  bool checkBoxValue = false;
  bool circular = false;
  String? errorMessage;

  Future<void> signIn() async {
    setState(() {
      errorMessage = null;
    });
    setState(() {
      circular = true;
    });
    if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
      setState(() {
        errorMessage = "Please enter your email and password!";
      });
      return;
    }
    if (_emailController.text.isEmpty) {
      setState(() {
        errorMessage = "Please enter your email!";
      });
      return;
    }
    if (_passwordController.text.isEmpty) {
      setState(() {
        errorMessage = "Please enter your password!";
      });
      return;
    }

    try {
      firebase_auth.UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User signed in successfully! : ${userCredential.user!.email}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      String errorText = e.toString();
      if (e is firebase_auth.FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorText = "User not found!";
            break;
          case 'wrong-password':
            errorText = "Wrong password!";
            break;
          case 'invalid-email':
            errorText = "Invalid email!";
            break;
          default:
            errorText = "An unknown error occurred!";
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
                          color: Color.fromARGB(255, 63, 62, 62),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Textfield(
                      controller: _emailController,
                      label: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    Textfield(
                      controller: _passwordController,
                      label: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
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
                              'Remember me',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Itim',
                                color: Color.fromARGB(255, 63, 62, 62),
                              ),
                            ),
                            const SizedBox(width: 30),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              child: const Text(
                                'Forgot Password?',
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
                    // error handling
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
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: signIn,
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Itim',
                            color: Colors.white),
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
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            ' Sign Up',
                            style: TextStyle(
                              fontSize: 16,
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
          ),
        ),
      ],
    ));
  }
}
