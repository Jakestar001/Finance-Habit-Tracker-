import 'package:flutter/material.dart';
import 'habit_entry.dart';
import 'income_entry.dart';
import 'expense_entry.dart';

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
                  MaterialPageRoute(builder: (context) => const HabitEntry()),
                );
              },
              child: const Text('Go to Habit Entry'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IncomeEntry()),
                );
              },
              child: const Text('Go to Income Entry'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExpenseEntry()),
                );
              },
              child: const Text('Go to Expense Entry'),
            ),
          ],
        ),
      ),
    );
  }
}
