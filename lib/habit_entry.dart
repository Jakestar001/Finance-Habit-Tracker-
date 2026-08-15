import 'package:flutter/material.dart';

void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
 return const MaterialApp(
 home: HabitEntryScreen(),
 );
 }
}

class HabitEntryScreen extends StatelessWidget {
 const HabitEntryScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: const Text('Add Habit'),
 ),
 body: const Center(
 child: Text('Habit Entry Screen'),
 ),
 );
 }
}

