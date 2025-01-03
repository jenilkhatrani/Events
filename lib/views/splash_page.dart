import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Get.offAllNamed("/sign_up_page");
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/splash1.png"))),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Wel - come To Events",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
