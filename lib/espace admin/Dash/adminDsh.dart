import 'dart:convert';

import 'package:citoyen/espace%20admin/Dash/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Services/globals.dart';

class AdminDsh extends StatefulWidget {
  const AdminDsh({Key? key}) : super(key: key);

  @override
  State<AdminDsh> createState() => _AdminDshState();
}

class _AdminDshState extends State<AdminDsh> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  getStats() async {
    try {
      final response = await http.get(Uri.parse("$myBaseURL/stats"), headers: {});
      var result = jsonDecode(response.body);
      var data = {
        "youth": result['youth'],
        "old": result['old'],
        "adult": result['adult'],
        "female": result['female'],
        "male": result['male']
      };
      return data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: HeaderWidget(),
              flex: 0,
            ),
            FutureBuilder(
                future: getStats(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: Column(
                        children: [
                          SfCircularChart(
                            palette: <Color>[
                              Colors.orangeAccent,
                              Colors.brown,
                              Colors.green,
                            ],
                            title: ChartTitle(text: 'Age group'),
                            legend: Legend(
                                isVisible: true,
                                overflowMode: LegendItemOverflowMode.wrap,
                                backgroundColor: Color.fromARGB(0, 143, 212, 122)),
                            tooltipBehavior: _tooltipBehavior,
                            series: <CircularSeries>[
                              PieSeries<AGData, String>(
                                dataSource: [
                                  AGData(
                                    'Youth',
                                    snapshot.data["youth"],
                                  ),
                                  AGData(
                                    'old',
                                    snapshot.data["old"],
                                  ),
                                  AGData(
                                    'Elderly',
                                    snapshot.data["adult"],
                                  ),
                                ],
                                xValueMapper: (AGData data, _) => data.continent,
                                yValueMapper: (AGData data, _) => data.age,
                                dataLabelSettings: DataLabelSettings(isVisible: true),
                                enableTooltip: true,
                              ),
                            ],
                          ),
                          Flexible(
                            child: SfCircularChart(
                              palette: const <Color>[
                                Color.fromARGB(255, 255, 64, 182),
                                Color.fromARGB(255, 124, 204, 247),
                              ],
                              title: ChartTitle(text: 'Gender group'),
                              legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  backgroundColor: Color.fromARGB(0, 143, 212, 122)),
                              tooltipBehavior: _tooltipBehavior,
                              series: <CircularSeries>[
                                PieSeries<GData, String>(
                                  dataSource: [
                                    GData(
                                      'Female',
                                      snapshot.data["female"],
                                    ),
                                    GData(
                                      'Male',
                                      snapshot.data["male"],
                                    ),
                                  ],
                                  xValueMapper: (GData data, _) => data.continent,
                                  yValueMapper: (GData data, _) => data.gender,
                                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                                  enableTooltip: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

class AGData {
  AGData(this.continent, this.age);
  final String continent;
  final int age;
}

class GData {
  GData(this.continent, this.gender);
  final String continent;
  final int gender;
}
