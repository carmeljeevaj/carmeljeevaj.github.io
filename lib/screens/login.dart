import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../components/gradient_btn.dart';
import '../storage/storage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> fs = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  final stringKey = 'name';
  Storage gs = Storage();
  // This clears all stored data
  // Method to store data
  void storeData() {
    gs.getStorage.write(stringKey, textEditingController.text); // Store a string
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gs.getStorage.erase();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFF9C60DC),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400), // Set a max width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                Form(
                  key: fs,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: textEditingController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter your name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      GradientButton(
                        text: "Proceed",
                        onPressed: () {
                          if (fs.currentState!.validate()) {
                            storeData();
                            Get.toNamed("/quizscreen");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
