import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen_controller.dart';
import '../../logic/health_fetch.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeScreenController controller = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.getData(),
            child: Icon(Icons.refresh),
          ),
          appBar: AppBar(title: Text("Welcome"),backgroundColor: Colors.black,),
          body: SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: height*0.05,
                      width: width*0.4,
                      decoration: BoxDecoration(
                      color: Colors.amber,
                      ),
                    child: Center(child: Text("Get Steps",style: GoogleFonts.quicksand(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),)),
                    ),
                  )
                ],
              ),
            ),
          ),
          // body: ValueListenableBuilder(
          //   valueListenable: controller.steps,
          //   builder: (context,value,child){
          //       return GridView(
          //         padding: EdgeInsets.all(15),
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           childAspectRatio: 1,
          //           mainAxisSpacing: 15,
          //           crossAxisSpacing: 15
          //         ),
          //         children: [
          //           // for(final blodGlucose in value)
          //           //   Card(
          //           //     child: Column(
          //           //       mainAxisAlignment: MainAxisAlignment.center,
          //           //       children: [
          //           //         Text(blodGlucose.value.toStringAsFixed(2)),
          //           //         Text(blodGlucose.unit),
          //           //         Text(blodGlucose.dateFrom.toString()),
          //           //         Text(blodGlucose.dataTo.toString())
          //           //       ],
          //           //     ),
          //           //   )
          //         ],
          //       );
          //   },
          // ),
        );
      }
    );
  }
}


