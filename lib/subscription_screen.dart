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
      'features': ['Increased habit tracking limit',
                   'Budget customization for tracking', 
                   'Monthly financial reports for deeper insights', 
                   'Data backup for information security']
    },
    {
      'name': 'Premium',
      'price': '\$19.99 / month',
      'features': [ 'Advanced AI insights with financial forecasting and personalized coaching.', 
                   'Unlimited habits and custom categories.', 
                   'Automated syncing for external bank accounts.', 
                   'Community Insights and Peer Communication feature facilitating secure file sharing for shared financial tips and strategies, supported by robust privacy controls.', 
                   'Receipt scanning and PDF document processing for automatic expense classification', 
                   'Seamless cloud syncing and no ads', 
                   'Goal setting with visual progress', 
                   'Multi-currency support', 
                   'Custom themes including light, dark, and system default modes', 
                   'Priority customer support and PDF exports', 
                   'Biometric security, PIN, and password options', 
                   'API keys for automated transactions', 
                   'Advanced push notifications and daily reminders for goals and habits, with customizable alerts']
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
