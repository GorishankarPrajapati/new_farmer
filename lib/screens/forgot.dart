import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:software_lab/screens/loginpage.dart';
import 'package:software_lab/screens/otp.dart';
import 'package:software_lab/utils/ui_constant.dart';
import 'package:http/http.dart' as http;

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumber = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "FarmerEats",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    const Text(
                      "Remember your password ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Login(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: bgBtnColor),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            controller: _phoneNumber,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter phone number";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: _isLoading
                            ? Center(
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: CircularProgressIndicator(
                                    color: bgBtnColor,
                                  ),
                                ),
                              ) // Show CircularProgressIndicator if loading
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(250, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  backgroundColor: bgBtnColor,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    sendOtp();
                                  }
                                },
                                child: const Text(
                                  "Send Code",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
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

  Future<void> sendOtp() async {
    setState(() {
      _isLoading = true; // Set isLoading to true while waiting for response
    });

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'GET',
      Uri.parse('https://sowlab.pw/assignment/user/forgot-password'),
    );
    request.body = json.encode({"mobile": _phoneNumber.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      String message = jsonResponse['message'];
      if (message.contains("OTP sent to your mobile.")) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                OtpVerify(phoneNumber: _phoneNumber.text),
          ),
        );

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
    } else {
      print(response.reasonPhrase);
    }

    setState(() {
      _isLoading = false; // Set isLoading to false once response is received
    });
  }
}
