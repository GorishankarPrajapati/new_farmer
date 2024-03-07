import 'package:flutter/material.dart';
import 'package:software_lab/screens/forgot.dart';
import 'package:software_lab/screens/loginpage.dart';
import 'package:software_lab/screens/registration_pages/registration2.dart';
import 'package:software_lab/screens/registration_pages/registration2.dart';
import 'package:software_lab/utils/ui_constant.dart';

class Registration1 extends StatefulWidget {
  const Registration1({super.key});

  @override
  State<Registration1> createState() => _Registration1();
}

class _Registration1 extends State<Registration1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _fullName = TextEditingController();
  TextEditingController _emailAddress = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();
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
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                "Signup 1 of 4",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                "Welcome!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image.asset("images/icon_google.png"),
                      )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.apple,
                          color: Colors.black,
                          size: 40,
                        ),
                      )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 40,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Center(
                child: Text(
                  "or login with",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            controller: _fullName,
                            decoration: const InputDecoration(
                                hintText: "Full Name",
                                prefixIcon: Icon(
                                  Icons.person_outlined,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter full name';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            controller: _emailAddress,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: "Email Address",
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email address';
                              } else if (!value.contains("@")) {
                                return "Please enter valid password";
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneNumber,
                            decoration: const InputDecoration(
                                hintText: "Phone Number",
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            controller: _password,
                            decoration: const InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            controller: _confirm_password,
                            decoration: const InputDecoration(
                                hintText: "Re-enter Password",
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm password';
                              } else if (value != _password.text) {
                                return "password didn't match";
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Login()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(200, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  backgroundColor: bgBtnColor),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Registration2(
                                                name: _fullName.text,
                                                email: _emailAddress.text,
                                                phnNumber: _phoneNumber.text,
                                                password: _password.text,
                                                confirmPassword:
                                                    _confirm_password.text,
                                              )));
                                }
                              },
                              child: const Text(
                                "Continue",
                                style: TextStyle(fontSize: 16),
                              )),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
