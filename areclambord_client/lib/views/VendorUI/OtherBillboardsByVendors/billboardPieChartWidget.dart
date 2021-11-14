import 'package:areclambord_client/Models/billboardPackageAmount.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BillboardPieChartWidget extends StatefulWidget {
  BillboardPieChartWidget({Key? key, required this.amountList})
      : super(key: key);
  List<BillboardPackageAmount> amountList;

  @override
  _BillboardPieChartWidgetState createState() => _BillboardPieChartWidgetState();
}

class _BillboardPieChartWidgetState extends State<BillboardPieChartWidget> {
  final List<charts.Series<BillboardPackageAmount, String>> _seriesBarData = [];
  late List<BillboardPackageAmount> myData;

  @override
  void initState() {    
    myData = widget.amountList;
    print(myData[0].billboardType);
    _generateData(myData);
    super.initState();
  }

  _generateData(List<BillboardPackageAmount> myData) {
    _seriesBarData.add(charts.Series(
        domainFn: (BillboardPackageAmount billbordPackageAmount, _) =>
            billbordPackageAmount.billboardType,
        measureFn: (BillboardPackageAmount billbordPackageAmount, _) =>
            billbordPackageAmount.billboardCount,
        colorFn: (BillboardPackageAmount billbordPackageAmount, _) =>
            charts.ColorUtil.fromDartColor(
                Color(int.parse(billbordPackageAmount.barColor))),
        id: 'PieCount',
        data: myData,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 800,
      // height: 600,
      constraints: const BoxConstraints(maxHeight: 600, maxWidth: 800),
      // padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: BorderRadius.circular(15.0)),
      child: Center(
        child: Column(
          children: [
            _seriesBarData.isNotEmpty
            ? Expanded(
              child: charts.PieChart(
                _seriesBarData,
                animationDuration: const Duration(seconds: 2),
                animate: true,
                // behaviors: [
                //   charts.DatumLegend(
                //       entryTextStyle: charts.TextStyleSpec(
                //         color: charts.MaterialPalette.purple.shadeDefault,
                //         fontSize: 7),
                //       // outsideJustification: charts.OutsideJustification.endDrawArea,
                //       // horizontalFirst: false,
                //       // desiredMaxRows: 2,
                //       // cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0, top: 4.0),                    
                //   )
                // ],
                defaultRenderer: charts.ArcRendererConfig(
                  // arcLength: 100,
              arcWidth: 60,
              arcRendererDecorators: [
                charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.inside
                  
                )
              ]
                ),
              ),
            )
            : const Text("No Chart", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
