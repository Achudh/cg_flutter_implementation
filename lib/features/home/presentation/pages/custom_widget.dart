import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomWidget extends ConsumerStatefulWidget {
  const CustomWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends ConsumerState<CustomWidget> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    const Map<String, double> dataMap = {
      'Cold': 35,
      'Warm': 35,
      'Hot': 90,
    };
    final double sum = dataMap.values.fold(0.0, (sum, value) => sum + value);
    Map<String, double> dataInPercentage = {};
    dataMap.forEach((key, value) {
      dataInPercentage.putIfAbsent(key, () => value / sum * 100);
    });
    log(dataInPercentage.entries.toString());
    const List<Color> colorList = [
      Colors.lightBlue,
      Colors.orange,
      Colors.red,
    ];
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 496;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: isScreenWide ? 270 : 500,
          width: MediaQuery.of(context).size.width - 75,
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prospect by Status',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flex(
                    direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PieChart(
                        dataMap: dataInPercentage,
                        ringStrokeWidth: 10,
                        chartType: ChartType.ring,
                        centerWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dataMap.values
                                  .fold(0.0, (sum, value) => sum + value)
                                  .toString(),
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total Prospects',
                              style: TextStyle(
                                color: Colors.blueGrey.shade400,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        animationDuration: const Duration(milliseconds: 800),
                        chartLegendSpacing: 20,
                        baseChartColor: Colors.white,
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValues: false,
                        ),
                        legendOptions: const LegendOptions(
                          showLegends: false,
                        ),
                        totalValue: 100,
                        initialAngleInDegree: -90,
                        chartRadius: 150,
                        colorList: colorList,
                      ),
                      SizedBox(
                        height: 150,
                        width: 175,
                        child: Legends(
                          dataInPercentage: dataInPercentage,
                          colorList: colorList,
                          dataMap: dataMap,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Legends extends StatelessWidget {
  const Legends({
    required this.dataInPercentage,
    required this.colorList,
    required this.dataMap,
    super.key,
  });

  final Map<String, double> dataInPercentage;
  final List<Color> colorList;
  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.sizeOf(context).width >= 496;
    log('width: ${MediaQuery.sizeOf(context).width.toString()}');
    return Center(
      child: ListView.builder(
        itemCount: dataInPercentage.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(5),
            color: Colors.transparent,
            elevation: 0,
            child: Flex(
              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 75,
                  child: Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorList[index],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        dataMap.keys.elementAt(index),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dataMap.values.elementAt(index).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      '${dataInPercentage.values.elementAt(index).round()}%',
                      style: TextStyle(
                        color: Colors.blueGrey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
