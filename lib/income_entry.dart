import 'package:flutter/material.dart';

class IncomeEntryScreen extends StatefulWidget {
  @override
  _IncomeEntryScreenState createState() => _IncomeEntryScreenState();
}

class _IncomeEntryScreenState extends State<IncomeEntryScreen> {
  final _amountController = TextEditingController();
  String? _selectedCategory;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Income')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              hint: Text('Select Category'),
              value: _selectedCategory,
              items: <String>['Salary', 'Investment', 'Freelance', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your save logic here
              },
              child: Text('Save Income'),
            ),
          ],
        ),
      ),
    );
@override
void dispose() {
  _amountController.dispose();
  super.dispose();
}

    
  }
}
