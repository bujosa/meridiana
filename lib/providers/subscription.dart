import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionProvider extends ChangeNotifier {
  late SharedPreferences prefs;
  bool isSubscribed = false;

  SubscriptionProvider() {
    _getSubscription();
  }

  void _getSubscription() async {
    prefs = await SharedPreferences.getInstance();
    isSubscribed = prefs.getBool('isSubscribed') ?? false;

    notifyListeners();
  }

  void switchProvider() async {
    isSubscribed = !isSubscribed;
    await prefs.setBool('isSubscribed', isSubscribed);

    notifyListeners();
  }
}
