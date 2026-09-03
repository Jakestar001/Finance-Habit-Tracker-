import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
 const PaymentScreen({Key? key}) : super(key: key);

 Future<void> _processPayment(BuildContext context) async {
 showDialog(
 context: context,
 barrierDismissible: false,
 builder: (context) => const Center(
 child: CircularProgressIndicator(),
 ),
 );

 // Simulate API call
 final response = await http.post(Uri.parse('YOUR_SERVER_URL'), body: ...);
 if (response.statusCode == 200) {
 if (!context.mounted) return;
 Navigator.pop(context); // Close the loading dialog

 Navigator.pushReplacementNamed(context, '/payment_success');
 }
  else {
   Navigator.pop(context)
    showDialog(
    context: context,builder: (context) => AlertDialog(
     title: const Text('Payment Failed'),
     content: const Text('Please try again.'),
     actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))];
     }
      
 @override
 Widget build(BuildContext context) {
 final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
 final selectedPlan = args['plan'] ?? 'Standard';

 return Scaffold(
 appBar: AppBar(
 title: const Text('Payment'),
 ),
 body: Center(
 child: Padding(
 padding: const EdgeInsets.all(16.0),
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 Text(
 'Completing payment for $selectedPlan Plan',
 style: Theme.of(context).textTheme.headlineSmall,
 textAlign: TextAlign.center,
 ),
 const SizedBox(height: 32),
 ElevatedButton(
 onPressed: () => _processPayment(context),
 child: const Text('Pay Now'),
 ),
 ],
 ),
 ),
 ),
 );
 }
}
