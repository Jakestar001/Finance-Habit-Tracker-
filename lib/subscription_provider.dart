import 'package:flutter/material.dart';

class SubscriptionProvider extends ChangeNotifier {
 String _currentTier = 'free';

 String get currentTier => _currentTier;

 void updateTier(String newTier) {
 _currentTier = newTier;
 notifyListeners();
 }
}
