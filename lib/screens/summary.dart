import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import '../storage/storage.dart';
import 'dart:html' as html; // Only for web download workaround
import 'dart:typed_data';
import 'package:flutter/foundation.dart';


import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
class SummaryPage extends StatefulWidget {
  @override
  State<SummaryPage> createState() => _SummaryPage();
}

class _SummaryPage extends State<SummaryPage> {
  final stringKey = 'name';
  
  QuizController quizController = Get.find<QuizController>();
  String? name;
  Storage gs = Storage();
  ScreenshotController screenshotController = ScreenshotController();

  // Method to retrieve data
  void retrieveData() {
    name = gs.getStorage.read(stringKey); // Retrieve the stored name
  }

  @override
  void initState() {
    super.initState();
    retrieveData(); 
    if(quizController.scoresStorage.isEmpty){
      // Retrieve data on initialization
Future.microtask(() => Get.offAllNamed('/'));  }
else{
  WidgetsBinding.instance.addPostFrameCallback((_){

    Get.dialog(AlertDialog(
      title: Text("Note:"),
      content: Text("Please click on the download icon located at the right bottom of the screen and share it via whatsapp"),
      actions: [
            ElevatedButton(onPressed: (){
              Get.back();
            }, child: Text("Alright!"))
      ],
    ));

  });
}
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: _takeScreenshotAndShare,child: Icon(Icons.download),),
        backgroundColor: Color(0XFF9C60DC),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400), // Set a max width
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
                children: [
                  // Display the stored name
                  Text(
                    "Hello, ${name ?? 'User'}",
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
              
                  // Title for the summary section
                  Text(
                    "Quiz Summary",
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  SizedBox(height: 10),
              
                  // Display scores for each level
                  Expanded(
                    child: 
                       ListView.builder(
                        itemCount: quizController.scoresStorage.length ,
                        itemBuilder: (context, index) {
                          final scoreData = quizController.scoresStorage[index];
                          return Card(
                            color: Colors.deepPurple[200],
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: ListTile(
                                
                                leading: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25, // Adjust the size of the CircleAvatar as needed
                                        child: Text(
                                          scoreData["level"],
                                          style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 10, // Reduced font size to fit within the circle
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center, // Center the text within the circle
                                        ),
                                      ),
                                title: Text(
                                  "${scoreData["score"]}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      
              
              
              
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _takeScreenshotAndShare() async {

    final image = await screenshotController.capture();

 if (kIsWeb) {
      // Web workaround: Download the screenshot as an image file
      final blob = html.Blob([image], 'image/png');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'screenshot.png')
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // // For mobile, share via WhatsApp if available
      // await Share.shareXFiles(
      //   [XFile.fromData(image, name: 'screenshot.png')],
      //   text: 'Check out my score!',
      //   sharePositionOrigin: Rect.fromLTWH(0, 0, 100, 100),
      // ).then((_) async {
      //   // Optional: Open WhatsApp with a custom message
      //   final url = Uri.parse("whatsapp://send?text=Check out my score!");
      //   if (await canLaunch(url.toString())) {
      //     await launch(url.toString());
      //   } else {
      //     print("WhatsApp not available");
      //   }
      // });
    }
}
  }
