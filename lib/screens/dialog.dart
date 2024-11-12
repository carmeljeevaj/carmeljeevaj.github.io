// info_dialog.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';


QuizController quizController = Get.find<QuizController>();

void showInformation() {
  Get.dialog(AlertDialog(
    title: Text("Note:"),
    content: SizedBox(
      height: 300,
      width: 300,
      child: ListView(
        children: [
          Text("Each of these emojis has points"),
          SizedBox(height: 5),
          infoWidget(imageName: "thumbs_up.png", value: quizController.level.value == 1 ?  "5" : "1"  ),
          SizedBox(height: 5),
          infoWidget(imageName: "sad.png", value:quizController.level.value == 1 ? "4" : "2"),
          SizedBox(height: 5),
          infoWidget(imageName: "thinking.png", value: quizController.level.value == 1 ?"3":"3"),
          SizedBox(height: 5),
          infoWidget(imageName: "smiley.png", value:quizController.level.value == 1 ? "2" : "4"),
          SizedBox(height: 5),
          infoWidget(imageName: "hand.png", value: quizController.level.value == 1 ?"1" : "5"),
        ],
      ),
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("I understand"),
      ),
    ],
  ));
}

class infoWidget extends StatelessWidget {
  final String? imageName;
  final String? value;

  infoWidget({
    required this.imageName,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "icons/$imageName",
          height: 50,
          width: 50,
        ),
        Text(
          ": $value",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
