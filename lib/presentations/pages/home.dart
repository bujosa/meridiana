import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meridiana/presentations/widgets/home/trending_subscription_tile.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:meridiana/shared/utils/category_map.dart';
import 'package:provider/provider.dart';
import '../widgets/global/bottom_navigation_bar.dart';
import '../widgets/home/home_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HomeTitle(),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currencyToIconHomePage[subscriptionProvider.currency] ??
                        const Icon(
                          Icons.attach_money,
                          color: Colors.white,
                          size: 40,
                        ),
                    Text(
                      subscriptionProvider.total.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 300.0,
                              color: Colors.white,
                              offset: Offset(0, 65),
                            ),
                          ],
                          fontSize: 80,
                          overflow: TextOverflow.clip),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('Monthly payments',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
              const SizedBox(height: 40),
              subscriptionProvider.subscriptions.isEmpty
                  ? const Center(
                      child: Text('Add subscriptions to see your trends',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text('Trending subscriptions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          )),
                    ),
              const TrendingSubscriptionTile()
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 0));
  }
}
