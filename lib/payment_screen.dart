import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
 const PaymentScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
 final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
 final String selectedPlan = args['plan'] ?? 'Standard';

 return Scaffold(
 appBar: AppBar(
 title: const Text('Payment'),
 ),
 body: Center(
 child: Padding(
 padding: const EdgeInsets.all(16.0),
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 children: 
