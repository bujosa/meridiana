import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meridiana/shared/providers/subscription.dart';
import 'package:meridiana/shared/utils/category_map.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BarChartGroupData> showingGroups = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(toY: 100, color: Colors.amber, width: 20),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(toY: 500, color: Colors.blue, width: 20),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(toY: 126, color: Colors.red, width: 20),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(toY: 200, color: Colors.green, width: 20),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(toY: 300, color: Colors.purple, width: 20),
      ],
      showingTooltipIndicators: [0],
    ),
  ];

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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
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
              ),
              const SizedBox(height: 60),
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
              subscriptionProvider.subscriptions.isNotEmpty
                  ? Center(
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: ListView.builder(
                            itemCount:
                                subscriptionProvider.top3Subscriptions.length,
                            itemBuilder: (context, index) {
                              final subscription =
                                  subscriptionProvider.top3Subscriptions[index];

                              return ListTile(
                                leading: CachedNetworkImage(
                                  imageUrl: subscription.image,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
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
                                    categoryToTitle[subscription.category]
                                        as String),
                                trailing:
                                    Text(subscription.price.toStringAsFixed(2)),
                              );
                            }),
                      ),
                    )
                  : const SizedBox()
              //   Center(
              //     child: Container(
              //       height: 300,
              //       width: 300,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: Theme.of(context).colorScheme.background,
              //       ),
              //       child: SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: SizedBox(
              //             width: 500,
              //             child: BarChart(
              //               BarChartData(
              //                 barGroups: showingGroups,
              //                 borderData: FlBorderData(
              //                   show: false,
              //                 ),
              //                 titlesData: FlTitlesData(
              //                     show: true,
              //                     bottomTitles: AxisTitles(
              //                       sideTitles: SideTitles(
              //                         showTitles: true,
              //                         getTitlesWidget: (value, meta) {
              //                           if (value == 0) {
              //                             return const Text(
              //                               '🏥',
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: 10,
              //                               ),
              //                             );
              //                           } else {
              //                             if (value == 1) {
              //                               return const Text(
              //                                 '📺',
              //                                 style: TextStyle(
              //                                   color: Colors.white,
              //                                   fontSize: 20,
              //                                 ),
              //                               );
              //                             } else {
              //                               if (value == 2) {
              //                                 return const Text(
              //                                   '📺',
              //                                   style: TextStyle(
              //                                     color: Colors.white,
              //                                     fontSize: 20,
              //                                   ),
              //                                 );
              //                               } else if (value == 3) {
              //                                 return const Text(
              //                                   '🍲',
              //                                   style: TextStyle(
              //                                     color: Colors.white,
              //                                     fontSize: 20,
              //                                   ),
              //                                 );
              //                               } else {
              //                                 return const Text(
              //                                   '',
              //                                   style: TextStyle(
              //                                     color: Colors.white,
              //                                     fontSize: 10,
              //                                   ),
              //                                 );
              //                               }
              //                             }
              //                           }
              //                         },
              //                       ),
              //                     ),
              //                     leftTitles: AxisTitles(
              //                       sideTitles: SideTitles(
              //                         showTitles: false,
              //                       ),
              //                     ),
              //                     topTitles: AxisTitles(
              //                       sideTitles: SideTitles(
              //                         showTitles: false,
              //                       ),
              //                     ),
              //                     rightTitles: AxisTitles(
              //                       sideTitles: SideTitles(
              //                         showTitles: false,
              //                       ),
              //                     )),
              //               ),
              //               swapAnimationDuration:
              //                   const Duration(milliseconds: 150), // Optional
              //               swapAnimationCurve: Curves.linear, // Optional
              //             )),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 0));
  }
}
