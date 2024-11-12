import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../components/gradient_btn.dart';
import '../controllers/quiz_controller.dart';
import 'dart:html' as html; // Only for web download workaround
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '../storage/storage.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final QuizController quizController = Get.find();
  late ConfettiController _confettiController;
  final ScreenshotController _screenshotController = ScreenshotController();
  Storage gs = Storage();
  String? name;
  @override
  void initState() {

    super.initState();
      name = gs.getStorage.read("name");

    _confettiController = ConfettiController(duration: Duration(seconds: 2));
    if (quizController.score.value >= 50) {
      _confettiController.play(); // Play confetti for high scores
    } else if (quizController.score.value == 0) {
      quizController.resetList();
      Future.microtask(() => Get.offAllNamed('/'));
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF9C60DC),
      
      body: Screenshot(
        controller: _screenshotController,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
              ),


                            Text("Congratulations!!!",style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),)
,                            Text(name ?? "No Name",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)
,
              Text("LEVEL ${quizController.level.value - 1}",style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),)
,   
              SizedBox(height: 15),

              _trophyWidget(),

              SizedBox(height: 20),
              Text(
                "Your Score: ${quizController.score.value}",
                style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Share button
              //onPressed: _takeScreenshotAndShare,

             SizedBox
        (height: 50,
        width: 200,
          child: GradientButton(text: "Share",onPressed: _takeScreenshotAndShare,)),

                        SizedBox(height: 15),


          if(quizController.level.value !=3)
            SizedBox(
              height: 50,
              width: 200,
              child: GradientButton(onPressed: (){
                if(quizController.level.value == 2 ){
                  quizController.resetQuiz();
                  Get.toNamed("/quizscreen");
                }
              }, text:  "Level 2")),
          if(quizController.level.value ==3)
              SizedBox(
              height: 50,
              width: 200,
              child: GradientButton(onPressed: (){
                  Get.toNamed("/summary");
                
              }, text:  "Summary")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _trophyWidget() {
    String trophyImage;
    if (quizController.score.value >= 76) {
      trophyImage = '/gold.json';
    } else if (quizController.score.value >= 51) {
      trophyImage = '/silver.json';
    } else {
      trophyImage = '/bronze.json';
    }

    return Lottie.asset(trophyImage, width: 200, height: 200, fit: BoxFit.fill);
  }

  // Method to share the screenshot
Future<void> _takeScreenshotAndShare() async {

    final image = await _screenshotController.capture();

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
