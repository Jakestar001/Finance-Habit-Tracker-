import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String _selectedPlan = 'Free';

  final List<Map<String, dynamic>> _plans = [
    {
      'name': 'Free',
      'price': '\$0 / month',
      'features': ['Basic expense tracking', 'Limited habit goals', 'Standard reports'],
    },
    {
      'name': 'Standard',
      'price': '\$9.99 / month',
      'features': ['Unlimited expense tracking', 'Up to 10 habit goals', 'Export data to CSV'],
    },
    {
      'name': 'Premium',
      'price': '\$19.99 / month',
      'features': ['Unlimited everything', 'Advanced analytics', 'Priority support', 'Cloud backup'],
    },
  ];

  void _handleContinue() {
    if (_selectedPlan == 'Free') {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      Navigator.pushNamed(
        context,
        '/payment',
        arguments: {'plan': _selectedPlan},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Plan'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _plans.length,
                  itemBuilder: (context, index) {
                    final plan = _plans[index];
                    final isSelected = _selectedPlan == plan['name'];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedPlan = plan['name'];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    plan['name'],
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    plan['price'],
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              ...List.generate(
                                plan['features'].length,
                                (fIndex) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        size: 18,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(plan['features'][fIndex]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _handleContinue,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
