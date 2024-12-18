import 'package:flutter/material.dart';
import 'package:hydro_chronicle/components/welcome_row.dart';
import 'package:hydro_chronicle/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Background color
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 177, 218, 245),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Itim',
                        color: Colors.black,
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/crown_logo.png'),
                      height: 80,
                      width: 80,
                    ),
                  ],
                ),
                const Text(
                  'Hydro Chronicle',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Itim',
                    color: Colors.black,
                  ),
                ),
                // Row 1
                const SizedBox(height: 100),
                const WelcomeRow(
                    title: 'Create Tasks Easily and Quickly',
                    description: 'Input tasls, subtasks and repetitive tasks',
                    imagePath: 'assets/images/createImage.png'),
                // Row 2
                const SizedBox(height: 30),
                const WelcomeRow(
                    title: 'Task Reminders',
                    description:
                        'Set Reminders and never miss important things',
                    imagePath: 'assets/images/taskReminder.png'),
                // Row 3
                const SizedBox(height: 30),
                const WelcomeRow(
                    title: 'Personalized Widgets',
                    description:
                        'Create widgets and view your tasks more easily.',
                    imagePath: 'assets/images/createWidgets.png'),
                // whole button
                const SizedBox(height: 100),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Image(
                          image: AssetImage('assets/images/furContinue.png'),
                          height: 160,
                          width: 160,
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: -25,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 60),
                              backgroundColor:
                                  const Color.fromARGB(255, 67, 92, 218),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                            ),
                            child: const Text(
                              'Continue >>',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Itim',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
