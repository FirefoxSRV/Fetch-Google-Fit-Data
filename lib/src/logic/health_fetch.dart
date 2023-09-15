import 'package:bluetooth_api/src/models/blood_glucose.dart';
import 'package:health/health.dart';

import '../models/steps.dart';


class HealthFetch{

  final health = HealthFactory();



  Future<bool> getBloodPressureDiastolic() async{
    bool requested = await health.requestAuthorization([HealthDataType.BLOOD_PRESSURE_DIASTOLIC]);
    if(requested){
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(DateTime.now().subtract(Duration(days: 1)), DateTime.now(), [HealthDataType.BLOOD_PRESSURE_DIASTOLIC]);

      return healthData.isNotEmpty;
    }
    return false;

  }



  Future<List<BloodGlucose>> getBloodGlucose() async{
    bool requested = await health.requestAuthorization([HealthDataType.BLOOD_GLUCOSE]);
    if(requested){
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(DateTime.now().subtract(Duration(days: 1)), DateTime.now(), [HealthDataType.BLOOD_GLUCOSE]);
      print(healthData);
      return healthData.map((e) {
        return BloodGlucose(double.parse(e.value.toJson()['numericValue']), e.unitString, e.dateFrom, e.dateTo);
      }).toList();
    }
    return [];

  }

  // Future<int?> getSteps() async{
  //   HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
  //   // bool requested = await health.requestAuthorization(types);
  //   var now = DateTime.now();
  //   var types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE,HealthDataType.HEART_RATE, HealthDataType.BLOOD_OXYGEN];
  //   var permissions = [
  //     HealthDataAccess.READ_WRITE,
  //     HealthDataAccess.READ_WRITE,
  //     HealthDataAccess.READ_WRITE,
  //     HealthDataAccess.READ_WRITE
  //   ];
  //   await health.requestAuthorization(types, permissions: permissions);
  //   bool success = await health.writeHealthData(10, HealthDataType.STEPS, now, now);
  //   success = await health.writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);
  //   success = await health.writeBloodOxygen(105, now, now);
  //   var midnight = DateTime(now.year, now.month, now.day);
  //   int? steps = await health.getTotalStepsInInterval(midnight, now);
  //   List<HealthDataPoint>? heartRate = await health.getHealthDataFromTypes(DateTime.now().subtract(Duration(hours: 1)),DateTime.now(), [HealthDataType.HEART_RATE]);
  //   List<HealthDataPoint>? glucose = await health.getHealthDataFromTypes(
  //     DateTime.now().subtract(Duration(hours: 1)),
  //     DateTime.now(),
  //     [HealthDataType.BLOOD_GLUCOSE],
  //   );
  //   return steps;
  // }

  Future<List<dynamic>> getParameters() async{

    HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
    var types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.HEART_RATE,
      HealthDataType.BLOOD_OXYGEN
    ];
    bool requested = await health.requestAuthorization(types);
    var now = DateTime.now();
    var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    await health.requestAuthorization(types, permissions: permissions);
    bool success = await health.writeHealthData(10, HealthDataType.STEPS, now, now);
    success = await health.writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);
    success = await health.writeBloodOxygen(105, now, now);
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health.getTotalStepsInInterval(midnight, now);
    List<HealthDataPoint>? heartRate = await health.getHealthDataFromTypes(DateTime.now().subtract(Duration(days: 1)),DateTime.now(), [HealthDataType.HEART_RATE]);
    List<HealthDataPoint>? glucose = await health.getHealthDataFromTypes(
      DateTime.now().subtract(Duration(days: 1)),
      DateTime.now(),
      [HealthDataType.BLOOD_GLUCOSE],
    );
    List<HealthDataPoint>? spo2 = await health.getHealthDataFromTypes(DateTime.now().subtract(Duration(days: 1)),DateTime.now(), [HealthDataType.BLOOD_OXYGEN]);
    return [steps,glucose,heartRate,spo2];
    // return [steps,heartRate,spo2];
  }



  Future<int> getSteps(){
    var totalParameters = getParameters();
    return totalParameters.then((value) {
      return value[0]?value[0]:0;
    });
  }

  Future<List<dynamic>> getSpo2() {
    var totalParameters = getParameters();
    return totalParameters.then((value) {
      return value[3];
    });
  }


  Future<List<dynamic>> getGlucose() {
    var totalParameters = getParameters();
    return totalParameters.then((value) {
      return value[1];
    });
  }


  Future<List<dynamic>> getHeartRate() {
    var totalParameters = getParameters();
    return totalParameters.then((value) {
      return value[2];
    });
  }


}
