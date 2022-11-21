import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OTPgenrate(),
    ),
  );
}

class OTPgenrate extends StatefulWidget {
  const OTPgenrate({Key? key}) : super(key: key);

  @override
  State<OTPgenrate> createState() => _OTPgenrateState();
}

class _OTPgenrateState extends State<OTPgenrate> {
  @override
  TextEditingController numberGenrator = TextEditingController();
  int a = 0, b = 0;
  List generateOtpContainer = [];

  Random random = Random();
  int generateOTP = 0;

  String userinput = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "OTP Genrator",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xffF6DB87),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                height: 50,
                width: 250,
                child: TextField(
                  controller: numberGenrator,
                  style: const TextStyle(
                    color: Color(0xffF6DB87),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter The OTP Length",
                    helperStyle: TextStyle(
                      color: Color(0xff6DB87),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    generateOtpContainer.clear();

                    b = int.parse(numberGenrator.text);

                    if (b == 4 || b == 6 || b == 8) {
                      for (a = 0; a < b; a++) {
                        generateOTP = random.nextInt(10);
                        generateOtpContainer.add(generateOTP);
                      }
                    } else {
                      generateOtpContainer.add("invelid OTP Length");
                    }

                    print(generateOtpContainer);
                  });
                },
                child: Ink(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffFFE8D8),
                          Color(0xffFF6BD87),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Text(
                      "Generate OTP",
                      style: TextStyle(
                        color: Color(0xff15172B),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 80,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffFFE8D8),
                  Color(0xffFF6BD87),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: generateOtpContainer.map((e) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "$e",
                    style: const TextStyle(
                      color: Color(0xff15172B),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    generateOtpContainer.clear();
                  });
                },
                child: Ink(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffFFE8D8),
                          Color(0xffFF6BD87),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Text(
                      "RESET",
                      style: TextStyle(
                        color: Color(0xff15172B),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xff15172B),
    );
  }
}
