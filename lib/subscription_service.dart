enum SubscriptionPlan { free, standard, premium }

class SubscriptionService {
 SubscriptionPlan _currentPlan = SubscriptionPlan.free;

 SubscriptionPlan get currentPlan => _currentPlan;

 void updatePlan(SubscriptionPlan newPlan) {
 _currentPlan = newPlan;
 }
}
