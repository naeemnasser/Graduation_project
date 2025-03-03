import 'package:adaa/item/app_bar_items_updated.dart';

import 'package:adaa/presentation/views/financial_ffairs/financial_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancialStatisticsPage extends StatelessWidget {
  const FinancialStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if we're embedded in a tab or standalone
    final bool isEmbedded = ModalRoute.of(context)?.settings.name == null;

    Widget content = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Financial Statistics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Student ID')),
                    DataColumn(label: Text('College')),
                    DataColumn(label: Text('Academic Year')),
                    DataColumn(label: Text('Total Cost')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('97100')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('2021-2022')),
                      DataCell(Text('20,000LE')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('94155')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('2022-2023')),
                      DataCell(Text('25,000LE')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3')),
                      DataCell(Text('94170')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('2022-2023')),
                      DataCell(Text('25,000LE')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3')),
                      DataCell(Text('94400')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('2022-2023')),
                      DataCell(Text('25,000LE')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('4')),
                      DataCell(Text('94900')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('2022-2023')),
                      DataCell(Text('35,000LE')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('5')),
                      DataCell(Text('9417')),
                      DataCell(Text('Computer Science')),
                      DataCell(Text('2022-2023')),
                      DataCell(Text('25,000LE')),
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Statistics Graph',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 300,
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              String text = '';
                              if (value.toInt() % 2 == 1) {
                                return const SizedBox.shrink();
                              }
                              switch (value.toInt()) {
                                case 2016:
                                  text = '16K';
                                  break;
                                case 2018:
                                  text = '18K';
                                  break;
                                case 2020:
                                  text = '20K';
                                  break;
                                case 2022:
                                  text = '22K';
                                  break;
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  text,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2),
                          left: BorderSide(color: Colors.black, width: 2),
                          right: BorderSide(color: Colors.transparent),
                          top: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(2015, 100),
                            FlSpot(2016, 300),
                            FlSpot(2017, 250),
                            FlSpot(2018, 280),
                            FlSpot(2019, 320),
                            FlSpot(2020, 400),
                            FlSpot(2021, 700),
                            FlSpot(2022, 850),
                            FlSpot(2023, 900),
                          ],
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.blue,
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {},
                child: const Text('Print',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );

    if (isEmbedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Financial Statistics',
        imagePath: 'assets/advisorylogostroke.png',
        backDestination: FinancialDashboard(),
      ),
      body: content,
    );
  }
}
