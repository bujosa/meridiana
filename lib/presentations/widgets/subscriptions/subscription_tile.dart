import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meridiana/shared/models/subscription.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:meridiana/shared/utils/category_map.dart';
import 'package:provider/provider.dart';

class SubscriptionTile extends StatefulWidget {
  const SubscriptionTile({super.key, required this.subscription});

  final Subscription subscription;

  @override
  State<SubscriptionTile> createState() => _SubscriptionTileState();
}

class _SubscriptionTileState extends State<SubscriptionTile> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Card(
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: widget.subscription.image,
              imageBuilder: (context, imageProvider) => Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.subscription.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                Text('${widget.subscription.price} / mo',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    )),
              ],
            ),
            subtitle:
                Text(categoryToTitle[widget.subscription.category] as String),
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
                                  .removeSubscription(widget.subscription);
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
  }
}
