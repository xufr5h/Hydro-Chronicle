import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          ),
        ),
      ],
    ));
  }
}
