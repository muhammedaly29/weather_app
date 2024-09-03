import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather 😔 \n Start searching now 🔍',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      ),
    );
  }
}
