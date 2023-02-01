import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/subscription.dart';

class SubscriptionProvider with ChangeNotifier {
  List<Subscription> subscriptions = <Subscription>[];
  String name = '';
  int currency = 0;

  late SharedPreferences prefs;

  SubscriptionProvider() {
    _loadSubscriptions();
  }

  Future<void> _loadSubscriptions() async {
    prefs = await SharedPreferences.getInstance();
    String? subscriptionString = prefs.getString('subscriptions_key');
    name = prefs.getString('name_key') ?? 'John Doe';
    currency = prefs.getInt('currency_key') ?? 0;

    subscriptions = subscriptionString == null
        ? []
        : Subscription.decode(subscriptionString);

    notifyListeners();
  }

  Future<void> addSubscription(Subscription subscription) async {
    subscriptions.add(subscription);
    await _saveSubscriptions();
  }

  Future<void> removeSubscription(Subscription subscription) async {
    subscriptions.remove(subscription);
    await _saveSubscriptions();
  }

  Future<void> _saveSubscriptions() async {
    String subscriptionString = Subscription.encode(subscriptions);
    await prefs.setString('subscriptions_key', subscriptionString);
    notifyListeners();
  }

  Future<void> setName(String name) async {
    this.name = name;
    await prefs.setString('name_key', name);

    notifyListeners();
  }

  Future<void> setCurrency(int currency) async {
    this.currency = currency;
    await prefs.setInt('currency_key', currency);
    notifyListeners();
  }

  Future<void> clear() async {
    await prefs.clear();
    await _loadSubscriptions();
  }

  double get total => subscriptions.fold<double>(
      0,
      (double previousValue, Subscription element) =>
          previousValue + element.price);

  int get totalSubscriptions => subscriptions.length;

  List<Subscription> get top3Subscriptions {
    List<Subscription> sortedSubscriptions = subscriptions
        .where((element) => element.price > 0)
        .toList()
      ..sort((a, b) => b.price.compareTo(a.price));

    if (sortedSubscriptions.length < 3) {
      return sortedSubscriptions;
    }

    return sortedSubscriptions.sublist(0, 3);
  }
}
