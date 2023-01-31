import 'package:flutter/material.dart';
import 'package:meridiana/presentations/pages/account.dart';
import 'package:meridiana/presentations/pages/add_subscription.dart';
import 'package:meridiana/presentations/pages/home.dart';
import 'package:meridiana/presentations/pages/subscriptions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meridiana',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              cardColor: const Color.fromARGB(255, 37, 36, 36),
              brightness: Brightness.dark,
              primarySwatch: Colors.amber,
              errorColor: Colors.red,
              backgroundColor: const Color.fromARGB(255, 37, 36, 36))),
      color: Colors.grey,
      home: const HomePage(),
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePage(),
        '/subscriptions': (BuildContext context) => const SubscriptionsPage(),
        '/account': (BuildContext context) => const AccountPage(),
        '/add_subscription': (BuildContext context) =>
            const AddSubscriptionPage(),
      },
    );
  }
}
