import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Verify your account'),
            const Text('Enter the 6-digit code sent to your email.'),
            // Add 6 text fields for the code here
            ElevatedButton(
              onPressed: () {},
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
