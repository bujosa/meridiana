import 'package:flutter/material.dart';
import 'package:meridiana/presentations/widgets/subscriptions/subscription_tile.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:provider/provider.dart';
import '../widgets/global/bottom_navigation_bar.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({super.key});

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Text(
            'Subscriptions',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 30,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.add_box,
                    size: 35, color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  Navigator.pushNamed(context, '/add_subscription');
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: subscriptionProvider.subscriptions.length,
            itemBuilder: (context, index) {
              final subscription = subscriptionProvider.subscriptions[index];
              return SubscriptionTile(
                subscription: subscription,
              );
            },
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 1));
  }
}
