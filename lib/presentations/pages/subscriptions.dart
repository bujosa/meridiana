import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meridiana/shared/models/subscription.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigation_bar.dart';

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
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Card(
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: subscription.image,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(subscription.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                          Text('${subscription.price} / mo',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 20,
                              )),
                        ],
                      ),
                      subtitle: const Text('Streaming'),
                      onLongPress: () => {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete'),
                                content: const Text('Are you sure?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => {
                                      setState(() {
                                        subscriptionProvider
                                            .removeSubscription(subscription);
                                      }),
                                      Navigator.pop(context)
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            })
                      },
                    ),
                  ));
            },
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 1));
  }
}
