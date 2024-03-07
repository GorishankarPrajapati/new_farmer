import 'package:flutter/material.dart';

import 'package:software_lab/screens/registration_pages/registration1.dart';
import 'package:software_lab/utils/ui_constant.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                "Reset Password?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Remam your password ?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(color: bgBtnColor),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "New Password",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.black,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Confirm New Password",
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.black,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
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
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: bgBtnColor),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Registration1()));
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                ],
              )),
            ],
          ),
        )),
      ),
    );
  }
}
