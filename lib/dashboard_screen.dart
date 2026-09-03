import 'package:flutter/material.dart';
import 'add_transaction_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 30),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back, User!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const ExpansionTile(
              title: Text('Financial Summary'),
              leading: Icon(Icons.account_balance_wallet),
              children: [
                ListTile(
                  title: Text('Monthly Income'),
                  trailing: Text('\$3,200.00'),
                ),
                ListTile(
                  title: Text('Monthly Expenses'),
                  trailing: Text('\$1,850.50'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ExpansionTile(
              title: Text('Habits Tracker'),
              leading: Icon(Icons.track_changes),
              children: [
                CheckboxListTile(
                  value: true,
                  onChanged: null,
                  title: Text('Morning Exercise'),
                ),
                CheckboxListTile(
                  value: false,
                  onChanged: null,
                  title: Text('Read 30 Minutes'),
                ),
                CheckboxListTile(
                  value: true,
                  onChanged: null,
                  title: Text('Save \$10 Daily'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTransactionScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
