import 'package:flutter/material.dart';
import 'habit_entry.dart';
import 'income_entry.dart';

class DashboardScreen extends StatelessWidget {
 const DashboardScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: const Text('Dashboard'),
 ),
 body: Center(
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 ElevatedButton(
 onPressed: () {
 Navigator.push(
 context,
 MaterialPageRoute(builder: (context) => const HabitEntryScreen()),
 );
 },
 child: const Text('Go to Habit Entry'),
 ),
 const SizedBox(height: 20),
 ElevatedButton(
 onPressed: () {
 Navigator.push(
 context,
 MaterialPageRoute(builder: (context) => const IncomeEntryScreen()),
 );
 },
 child: const Text('Go to Income Entry'),
 ),
 ],
 ),
 ),
 );
 }
}
