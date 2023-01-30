import 'package:flutter/material.dart';
import 'package:meridiana/presentations/pages/account.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.amber,
              backgroundColor: const Color.fromARGB(255, 37, 36, 36))),
      color: Colors.grey,
      home: const HomePage(),
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePage(),
        '/subscriptions': (BuildContext context) => const SubscriptionsPage(),
        '/account': (BuildContext context) => const AccountPage(),
      },
    );
  }
}
