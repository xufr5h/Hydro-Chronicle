import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Image.asset(
                'assets/images/crown_logo.png',
                height: 50,
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Hydro Chronicle',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Itim',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 121, 192, 240),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 177, 218, 245),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/menu.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
