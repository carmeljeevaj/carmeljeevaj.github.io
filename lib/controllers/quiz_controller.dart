import 'package:get/get.dart';

class QuizController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var score = 0.obs;
  var progressValue = 0.0.obs;
  var level = 1.obs;
  RxList<Map<String, dynamic>> scoresStorage = <Map<String, dynamic>>[].obs;



  @override
  void onInit() {
    super.onInit();
    resetQuiz(); // Reset state when controller is initialized
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    progressValue.value = 0.0;
  }

  void resetList(){
    scoresStorage.clear();
  }

    //LEVEL 1 QUESTIONS


  Map<String,String> questions_1 = {
    "I am capable of achieving my goals.":"q1",
    "I learn and grow from my experiences.":"q2",
    "I am resilient and can handle challenges.":"q3",
    "I bring value to the lives of others":"q4",
    "I have talents and strengths":"q5",
    "I am kind and compassionate person":"q6",
    "I make a positive impact on those around me":"q7",
    "I am worthy of love and respect":"q8",
    "I am continuously improving and bettering myself":"q9",
    "I am confident in my abilities": "q10",
    "I have the power to make a difference in the world":"q11",
    "I am grateful for who I am and What I have":"q12",
    "I am in control of my thoughts and emotions":"q13",
    "I radiate positivity and attract good energy":"q14",
    "I deserve success and happiness":"q15",
    "I embrace new opportunities":"q16",
    "I am beautiful inside and out":"q17",
    "I am creative and innovative":"q18",
    "I am calm and composed under pressure":"q19",
    "I am proud of my accomplishments":"q20"
  };


  //LEVEL 2 QUESTIONS


Map<String,String> questions_2 = {
  "I procrastinate on important tasks":"q21",
  "Acknowledging the need for better time management":"q22",
  "I sometimes lack self-confidence":"q23",
  "Realizing the need to work on self-esteem":"q24",
  "I struggle with maintaing focus":"q25",
  "I avoid confrontation, even when it's necessary":"q26",
  "I find it hard to forgive and let go of grudges":"q27",
  "I have fear of failure that holds me back":"q28",
  "I tend to get easily frustrated or impatient":"q29",
  "I sometimes neglect self-care or wellness":"q30",
  "I don't always listen well to others":"q31",
  "I resist change, even when it's beneficial":"q32",
  "I find it hard to express my emotions clearly":"q33",
  "I can be indecisive, especially under pressure":"q34",
  "I avoid taking risks, even when they could lead to growth":"q35",
  "I sometimes prioritize others' opinions over my own":"q36",
  "I can be overly critical of myself and others":"q37",
  "Things are not good":"q38",
  "Mostly I feel happy when bullying friends":"q39",
  "I am more Egoistic person":"q40"
  
 
  };

  void selectAnswer(int value) {
  
  // Check for level 1
  if (level.value == 1) {
    score.value += value;

    progressValue.value = (currentQuestionIndex.value + 1) / questions_1.length;
    
    // Check if we have more questions in level 1
    if (currentQuestionIndex.value < questions_1.length - 1) {
      currentQuestionIndex.value++;
    } else {
      // If level 1 is completed, move to level 2 and reset the question index
      scoresStorage.add({
        "level":"Level 1",
        "score":"${score.value}"
      });
      level.value = 2;
      currentQuestionIndex.value = 0;  // Reset to first question of level 2
      progressValue.value = 0.0; // Reset progress for level 2
      Get.toNamed('/result'); // Navigate to result screen for level 1
    }
  } else {
      score.value += value;

    // For level 2
    progressValue.value = (currentQuestionIndex.value + 1) / questions_2.length;
    
    // Check if we have more questions in level 2
    if (currentQuestionIndex.value < questions_2.length - 1) {
      currentQuestionIndex.value++;
    } else {
      scoresStorage.add({
        "level":"Level 2",
        "score":"${score.value}"
      });
      // When level 2 is finished, navigate to the result screen
      level.value = 3;
      Get.offAllNamed('/result');
    }
  }
  }
  }