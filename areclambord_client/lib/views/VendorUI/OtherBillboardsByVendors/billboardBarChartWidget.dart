import 'package:areclambord_client/Models/billboardPackageAmount.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BillboardBarChartWidget extends StatefulWidget {
  BillboardBarChartWidget({Key? key, required this.amountList})
      : super(key: key);
  List<BillboardPackageAmount> amountList;

  @override
  _BillboardBarChartWidgetState createState() =>
      _BillboardBarChartWidgetState();
}

class _BillboardBarChartWidgetState extends State<BillboardBarChartWidget> {
  final List<charts.Series<BillboardPackageAmount, String>> _seriesBarData = [];
  late List<BillboardPackageAmount> myData;

  @override
  void initState() {
    myData = widget.amountList;
    _generateData(myData);
  }

  _generateData(myData) {
    _seriesBarData.add(charts.Series(
        domainFn: (BillboardPackageAmount billbordPackageAmount, _) =>
            billbordPackageAmount.billboardType,
        measureFn: (BillboardPackageAmount billbordPackageAmount, _) =>
            billbordPackageAmount.billboardCount,
        colorFn: (BillboardPackageAmount billbordPackageAmount, _) =>
            charts.ColorUtil.fromDartColor(
                Color(int.parse(billbordPackageAmount.barColor))),
        id: 'BillboardCount',
        data: myData,
        labelAccessorFn: (BillboardPackageAmount row, _) => row.billboardType));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 400,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(15.0)),
      child: Center(
        child: Column(
          children: <Widget>[
            const Text(
              "Billboard Amount",
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3,
            ),
            Expanded(
                child: charts.BarChart(
              _seriesBarData,
              animationDuration: const Duration(seconds: 2),
              animate: true,
              behaviors: [
                charts.DatumLegend(
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontSize: 7))
              ],
            )),
          ],
        ),
      ),
    );
  }
}


