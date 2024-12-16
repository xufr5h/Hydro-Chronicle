import 'package:flutter/material.dart';
import 'package:hydro_chronicle/components/welcome_row.dart';

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
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
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
                Text(
                  'Hydro Chronicle',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Itim',
                    color: Colors.black,
                  ),
                ),
                // Row 1
                SizedBox(height: 100),
                WelcomeRow(
                    title: 'Create Tasks Easily and Quickly',
                    description: 'Input tasls, subtasks and repetitive tasks',
                    imagePath: 'assets/images/createImage.png'),
                // Row 2
                SizedBox(height: 30),
                WelcomeRow(
                    title: 'Task Reminders',
                    description:
                        'Set Reminders and never miss important things',
                    imagePath: 'assets/images/taskReminder.png'),
                // Row 3
                SizedBox(height: 30),
                WelcomeRow(
                    title: 'Personalized Widgets',
                    description:
                        'Create widgets and view your tasks more easily.',
                    imagePath: 'assets/images/createWidgets.png')
              ],
            ),
          ),
        ),
        // Row 1
      ],
    ));
  }
}
