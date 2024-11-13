import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/summary.dart';

import 'controllers/quiz_controller.dart';
import 'screens/result_screen.dart';
import 'screens/login.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init(); 

    Get.put(QuizController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QUIZ APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
     getPages: [
 
      GetPage(name: "/", page: ()=>LoginPage()),
        GetPage(name: '/quizscreen', page: () => QuizScreen()),
        GetPage(name: '/result', page: () => ResultScreen()),
        GetPage(name: "/summary", page: ()=>SummaryPage())
      ],
    );
  }
}

