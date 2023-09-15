import 'dart:convert';
import 'package:bluetooth_api/src/Screens/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}


// class MyApp extends StatefulWidget {
//   const MyApp({Key? key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String data = ""; // Initialize data as an empty string
//
//   void fetchData() async {
//     const uri = "https://v1.nocodeapi.com/shreyv/fit/GMjNJSooBNOAvbwD/aggregatesDatasets?dataTypeName=steps_count";
//     final url = Uri.parse(uri);
//     final response = await http.get(url);
//     final body = response.body;
//     final json = jsonDecode(body);
//
//     setState(() {
//       data = json.toString(); // Update the data variable with the fetched JSON
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Wear OS Sample"),
//         ),
//         body: ListView(
//           children: [
//             MaterialButton(
//               color: Colors.red,
//               onPressed: fetchData,
//               child: Text(
//                 "Press me",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Text(data),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

