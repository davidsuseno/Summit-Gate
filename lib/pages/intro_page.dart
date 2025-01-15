import 'package:flutter/material.dart';
import 'package:summit_gate/pages/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(250, 249, 133, 9),
                const Color.fromARGB(255, 247, 178, 51),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    "assets/summitgatelogo.png",
                    width: 700,
                  ),
                ),
          
                const SizedBox(height: 20),
                //title
                Text(
                  "Siap mendaki hari ini?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
          
                const SizedBox(height: 20),
          
                //sub title
                Text(
                  "Menjual berbagai macam kebutuhan pendakian untuk mendukung setiap petualanganmu.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
          
                const SizedBox(height: 20),
          
                //button
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 9, 2, 35),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
