import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/src/features/widgets/medicine_times_widget.dart';
import 'package:get/get.dart';

import 'medicine_calendar_controller.dart';

class MedicineCalendarPage extends StatelessWidget {
  const MedicineCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var siz1e = MediaQuery.of(context).size;

    // return Scaffold(
    //   appBar: AppBar(title: const Text('Medicine Calendar')),
    //   body: const SingleChildScrollView(
    //       child: SizedBox(
    //     height: 600,
    //     child: Column(
    //       children: [MyHomePage(title: "test")], // Your Widget
    //     ),
    //   )),
    // );
    return Scaffold(
      appBar: AppBar(title: const Text('İlaç Tavkimim')),
      body: SingleChildScrollView(
          child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 100),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: MedicineTimesWidget()),
          ],
        ),
      )),
    );
  }
}
