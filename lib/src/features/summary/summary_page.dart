import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/src/utils/extensions/color_extensions.dart';

import '../../common/colors.dart';
import '../widgets/summary_chart_widget.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: AppColors.contentColorPurple.lighten(60),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(Icons.water_drop),
            SizedBox(
              width: 5,
            ),
            Text('Su Tüketimi'),
          ],
        ),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Haftalık Su Tüketim İstatistikleri",
              style: style,
            ),
          ),
          const SummaryChartWidget(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Bugün İçilmesi Gereken Su : 250ml",
              style: TextStyle(
                color: AppColors.contentColorRed.lighten(50),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
