import 'package:bluetooth_api/src/logic/health_fetch.dart';
import 'package:bluetooth_api/src/models/blood_glucose.dart';
import 'package:flutter/cupertino.dart';
import 'package:health/health.dart';

import '../../models/steps.dart';


class HomeScreenController{

  final data = HealthFetch();

  final bloodGlucose = ValueNotifier(<BloodGlucose>[]);
  late int steps;
  Future<void> getData() async{

    bloodGlucose.value = await data.getBloodGlucose();
    steps = (await data.getSteps())!;
    print("The steps are ${steps}");

    var spo2 = (await data.getSpo2())!;
    print("-------------------------$spo2");
  }

}