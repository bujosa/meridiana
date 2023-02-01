import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:meridiana/shared/utils/category_map.dart';
import 'package:provider/provider.dart';

class TrendingSubscriptionTile extends StatefulWidget {
  const TrendingSubscriptionTile({
    super.key,
  });

  @override
  State<TrendingSubscriptionTile> createState() =>
      _TrendingSubscriptionTileState();
}

class _TrendingSubscriptionTileState extends State<TrendingSubscriptionTile> {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return subscriptionProvider.subscriptions.isNotEmpty
        ? Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: ListView.builder(
                  itemCount: subscriptionProvider.top3Subscriptions.length,
                  itemBuilder: (context, index) {
                    final subscription =
                        subscriptionProvider.top3Subscriptions[index];

                    return ListTile(
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
                      title: Text(subscription.name),
                      subtitle: Text(
                          categoryToTitle[subscription.category] as String),
                      trailing: Text(subscription.price.toStringAsFixed(2)),
                    );
                  }),
            ),
          )
        : const SizedBox();
  }
}
