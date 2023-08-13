import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/play_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'Select a Playing Mode',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _choose(context, againstBot: false),
              child: const Text('Against a Friend'),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () => _choose(context, againstBot: true),
              child: const Text('Against a Bot'),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  void _choose(
    BuildContext context, {
    required bool againstBot,
  }) {
    final marks = ['X', 'O'];
    final random = Random();
    final player1 = marks[random.nextInt(2)];
    String? player2;
    if (!againstBot) {
      player2 = marks.firstWhere((element) => element != player1);
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlayScreen(
          player1Mark: player1,
          player2Mark: player2,
        ),
      ),
    );
  }
}
