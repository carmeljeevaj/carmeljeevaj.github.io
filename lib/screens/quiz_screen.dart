
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';
import '../storage/storage.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizController quizController = Get.find();

  // Base color for neumorphism (replaced with your desired color)
  final Color baseColor = Color(0XFF9C60DC); 
 // New color
    Storage gs = Storage();
String? name;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
          name = gs.getStorage.read("name");
          if(name == null){
            Get.offAllNamed("/");
          }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor, // Background color changed
      appBar: AppBar(
        backgroundColor: baseColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(child: Text("L"+quizController.level.value.toString())),
          )
        ], // AppBar background color updated
        title: Text(
          "Quiz",
          style: TextStyle(color: Colors.white), // Text color for contrast
        ),
      ),
      body: Column(
        children: [
          Obx(() => LinearProgressIndicator(
              value: quizController.progressValue.value,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink))),
          SizedBox(height: 2),

          // Neumorphic question container
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            width: double.infinity,
            child: Obx(() => Center(
                  child: Text(
                    
                    (quizController.level.value == 1 ?  quizController.questions_1.keys : quizController.questions_2.keys)
                        .elementAt(quizController.currentQuestionIndex.value),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // White text
                    textAlign: TextAlign.center,
                  ),
                )),
            decoration: neumorphicDecoration(baseColor),
          ),

          Spacer(),

          // Neumorphic image container
          Container(
            padding: EdgeInsets.all(12),
            height: MediaQuery.of(context).size.width < 350 ? 250 : 380,
            width: MediaQuery.of(context).size.width < 350 ? 250 : 380,
            decoration: neumorphicDecoration(baseColor),
            child: Obx(() => Image.asset(
              
              fit: BoxFit.cover,
                '/images/${ (quizController.level.value == 1 ?  quizController.questions_1.values : quizController.questions_2.values).elementAt(quizController.currentQuestionIndex.value)}.jpg')),
          ),

          Spacer(),

          // Emoji buttons in a neumorphic design
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _neumorphicEmojiButton(emoji: "icons/thumbs_up.png", value: quizController.level.value == 1 ? 5 : 1),
                _neumorphicEmojiButton(emoji: "icons/sad.png", value: quizController.level.value == 1 ? 4 : 2),
                _neumorphicEmojiButton(emoji: "icons/thinking.png", value: quizController.level.value == 1 ? 3 : 3),
                _neumorphicEmojiButton(emoji: "icons/smiley.png", value: quizController.level.value == 1 ? 2 : 4),
                _neumorphicEmojiButton(emoji: "icons/hand.png", value: quizController.level.value == 1 ? 1 : 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Neumorphic emoji button with dynamic shadows
  Widget _neumorphicEmojiButton({required String emoji, required int value}) {
    return GestureDetector(
      onTap: () => quizController.selectAnswer(value),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: neumorphicDecoration(baseColor, shape: BoxShape.circle),
        child: Image.asset(
          emoji,
          height: 40,
          width: 40,
        ),
      ),
    );
  }

  // Function for generating neumorphic decoration
  BoxDecoration neumorphicDecoration(Color color,
      {BoxShape shape = BoxShape.rectangle}) {
    return BoxDecoration(
      color: color,
      shape: shape,
      borderRadius:
          shape == BoxShape.rectangle ? BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)) : null,
      boxShadow: [
        // Dark shadow for depth
        BoxShadow(
          color: darkenColor(color, 0.2),
          offset: Offset(5, 5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        // Light shadow for highlight
        BoxShadow(
          color: lightenColor(color, 0.2),
          offset: Offset(-5, -5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ],
    );
  }

  // Function to darken a color by a percentage
  Color darkenColor(Color color, double amount) {
    return Color.lerp(color, Colors.black, amount)!;
  }

  // Function to lighten a color by a percentage
  Color lightenColor(Color color, double amount) {
    return Color.lerp(color, Colors.white, amount)!;
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/quiz_controller.dart';

// class QuizScreen extends StatelessWidget {
//   final QuizController quizController =     Get.find();


//   // Base color for neumorphism (can be any color)
//   final Color baseColor = Colors.blue[100]!; // Replace with any color

// //  final imageName = quizController.questions.values
// //               .elementAt(quizController.currentQuestionIndex.value);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       appBar: AppBar(
//       backgroundColor: Colors.blue[100],
//         title: Text("Quiz"),
//       ),
//       body: Column(
//         children: [
//           Obx(() => LinearProgressIndicator(
//               value: quizController.progressValue.value)),
//           SizedBox(height: 16),
      
//           // Neumorphic question container
//           Container(
//             padding: EdgeInsets.all(20),
//             height: 100,
//             width: double.infinity,
//             child: Obx(() => Center(
//                   child: Text(
//                     quizController.questions.keys
//                         .elementAt(quizController.currentQuestionIndex.value),
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 )),
//             decoration: neumorphicDecoration(baseColor),
//           ),
      
//           Spacer(),
      
//           // Neumorphic image container
//           Container(
//             padding: EdgeInsets.all(12),
//             height: MediaQuery.of(context).size.width < 350 ? 250 : 380,
//             width: MediaQuery.of(context).size.width < 350 ? 250 : 380,
//             decoration: neumorphicDecoration(baseColor),
//             child: Obx(() => Image.asset(
//                 '/images/${quizController.questions.values.elementAt(quizController.currentQuestionIndex.value)}.jpg')),
//           ),
      
//           Spacer(),
      
//           // Emoji buttons in a neumorphic design
//           Padding(
//             padding: EdgeInsets.only(bottom: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _neumorphicEmojiButton(emoji: "/icons/thumbs_up.png", value: 5),
//                 _neumorphicEmojiButton(emoji: "/icons/sad.png", value: 4),
//                 _neumorphicEmojiButton(emoji: "/icons/thinking.png", value: 3),
//                 _neumorphicEmojiButton(emoji: "/icons/smiley.png", value: 2),
//                 _neumorphicEmojiButton(emoji: "/icons/hand.png", value: 1),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Neumorphic emoji button with dynamic shadows
//   Widget _neumorphicEmojiButton({required String emoji, required int value}) {
//     return GestureDetector(
//       onTap: () => quizController.selectAnswer(value),
//       child: Container(
//         padding: EdgeInsets.all(12),
//         decoration: neumorphicDecoration(baseColor, shape: BoxShape.circle),
//         child: Image.asset(
//           emoji,
//           height: 40,
//           width: 40,
//         ),
//       ),
//     );
//   }

//   // Function for generating neumorphic decoration
//   BoxDecoration neumorphicDecoration(Color color,
//       {BoxShape shape = BoxShape.rectangle}) {
//     return BoxDecoration(
//       color: color,
//       shape: shape,
//       borderRadius:
//           shape == BoxShape.rectangle ? BorderRadius.circular(12) : null,
//       boxShadow: [
//         // Dark shadow for depth
//         BoxShadow(
//           color: darkenColor(color, 0.2),
//           offset: Offset(5, 5),
//           blurRadius: 15,
//           spreadRadius: 1,
//         ),
//         // Light shadow for highlight
//         BoxShadow(
//           color: lightenColor(color, 0.2),
//           offset: Offset(-5, -5),
//           blurRadius: 15,
//           spreadRadius: 1,
//         ),
//       ],
//     );
//   }

//   // Function to darken a color by a percentage
//   Color darkenColor(Color color, double amount) {
//     return Color.lerp(color, Colors.black, amount)!;
//   }

//   // Function to lighten a color by a percentage
//   Color lightenColor(Color color, double amount) {
//     return Color.lerp(color, Colors.white, amount)!;
//   }
// }

