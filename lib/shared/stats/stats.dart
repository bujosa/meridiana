import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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