import 'package:flutter/material.dart';

class HabitEntryScreen extends StatefulWidget {
  const HabitEntryScreen({Key? key}) : super(key: key);

  @override
  State<HabitEntryScreen> createState() => _HabitEntryScreenState();
}

class _HabitEntryScreenState extends State<HabitEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _habitNameController = TextEditingController();
  String _selectedFrequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _habitNameController,
                decoration: const InputDecoration(
                  labelText: 'Habit Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.track_changes),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a habit name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Frequency',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedFrequency,
                items: ['Daily', 'Weekly'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedFrequency = newValue!;
                  });
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save Habit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
