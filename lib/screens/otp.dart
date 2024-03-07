import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:software_lab/screens/loginpage.dart';
import 'package:software_lab/screens/reset_password.dart';
import 'package:software_lab/utils/ui_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_page.dart';

class OtpVerify extends StatefulWidget {
  final String phoneNumber;

  OtpVerify({Key? key, required this.phoneNumber});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
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
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Pinput(
                        controller: _textEditingController,
                        length: 6,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(250, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            backgroundColor: bgBtnColor,
                          ),
                          onPressed: _isLoading ? null : otpVerify,
                          child: _isLoading
                              ? Center(
                                  child: SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: CircularProgressIndicator(
                                        color: bgBtnColor,
                                      ))) // Show CircularProgressIndicator while waiting
                              : const Text(
                                  "Submit",
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                      ),
                      TextButton(
                        onPressed: _isLoading ? null : sendOtp,
                        child: Text(
                          "Resend Code",
                          style: TextStyle(color: Colors.black),
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

  Future<void> otpVerify() async {
    setState(() {
      _isLoading = true; // Set isLoading to true when OTP verification begins
    });

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('https://sowlab.pw/assignment/user/verify-otp'),
    );
    request.body = json.encode({"otp": _textEditingController.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      String message = jsonResponse['message'];
      if (message.contains("OTP verified successful.")) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ResetPassword(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$message")));
      }
    } else {
      print(response.reasonPhrase);
    }

    setState(() {
      _isLoading =
          false; // Set isLoading to false when OTP verification completes
    });
  }

  Future<void> sendOtp() async {
    setState(() {
      _isLoading = true; // Set isLoading to true when sending OTP
    });

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('https://sowlab.pw/assignment/user/forgot-password'),
    );
    request.body = json.encode({"mobile": widget.phoneNumber});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());

      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      String message = jsonResponse['message'];
      if (message.contains("OTP sent to your mobile.")) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ResetPassword(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$message")));
      }
    } else {
      print(response.reasonPhrase);
    }

    setState(() {
      _isLoading = false; // Set isLoading to false when sending OTP completes
    });
  }
}
