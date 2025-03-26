import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const Textfield({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Itim',
              color: Color.fromARGB(255, 63, 62, 62),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
