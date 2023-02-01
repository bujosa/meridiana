import 'package:flutter/material.dart';
import 'package:meridiana/shared/models/subscription.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:provider/provider.dart';

class HomeTitle extends StatefulWidget {
  const HomeTitle({
    super.key,
  });

  @override
  State<HomeTitle> createState() => _HomeTitleState();
}

class _HomeTitleState extends State<HomeTitle> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 60),
      child: Text.rich(
        TextSpan(
          text: 'Hello, ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
          children: <TextSpan>[
            TextSpan(
              text: subscriptionProvider.name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
