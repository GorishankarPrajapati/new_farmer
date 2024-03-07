import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:http/http.dart' as http;
import 'package:software_lab/screens/forgot.dart';
import 'package:software_lab/screens/registration_pages/registration1.dart';
import 'package:software_lab/screens/registration_pages/registration_final.dart';
import 'package:software_lab/screens/forgot.dart';
import 'package:software_lab/utils/ui_constant.dart';
import "package:google_sign_in/google_sign_in.dart";
import 'home_page.dart';
import 'registration_pages/registration1.dart';
import 'registration_pages/registration_final.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _emailaddress = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isLoading = false; // Added isLoading variable
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Map<String, dynamic>? userdataFacebook;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  Future<void> googleSignIn() async {
    if (Platform.isAndroid) {
      _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
    }

    try {
      await _googleSignIn.signIn();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => RegistrationFinal()));
    } catch (e) {
      print(e.toString());
    }
  }

  Future _facebookLogin() async {
    final fb = FacebookLogin();

// Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
    ]);

// Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        // Logged in

        // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken;
        print('Access token: ${accessToken!.token}');

        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        final email = await fb.getUserEmail();
        if (email != null) print('And your email is $email');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => RegistrationFinal()));
        break;
      case FacebookLoginStatus.cancel:
        break;
      case FacebookLoginStatus.error:
        print('Error while log in: ${res.error}');
        break;
    }
  }

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
                  "Welcome back!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    const Text(
                      "New here ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Registration1(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create account",
                        style: TextStyle(color: bgBtnColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: TextFormField(
                            controller: _emailaddress,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "Email Address",
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                              border: InputBorder.none,
                            ),
                            validator: _validateEmail,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: TextFormField(
                            controller: _password,
                            validator: _validatePassword,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.black,
                              ),
                              suffixIcon: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Forgot(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot ?",
                                  style: TextStyle(
                                    color: bgBtnColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              border: InputBorder.none,
                            ),
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
                                child: CircularProgressIndicator(
                                  color: bgBtnColor,
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(250, 45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  backgroundColor: bgBtnColor,
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    _signIn();
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                      ),
                    ],
                  ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        googleSignIn();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image.asset("images/icon_google.png"),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.apple,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        _facebookLogin();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true; // Set isLoading to true while waiting for response
    });

    final String apiUrl = 'https://sowlab.pw/assignment/user/login';
    final String email = _emailaddress.text;
    final String password = _password.text;

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(apiUrl));
    request.body = json.encode({
      "email": _emailaddress.text,
      "password": _password.text,
      "role": "farmer",
      "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      "type": "email",
      "social_id": ""
    });
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        String message = jsonResponse['message'];
        if (message.contains("Login successful.")) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("$message")));
        }
      } else {
        print(response.reasonPhrase);
      }
    } on SocketException catch (e) {
      print('Socket Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Unable to establish connection')));
    } on TimeoutException catch (e) {
      print('Timeout Exception: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: Connection timed out')));
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred')));
    }

    setState(() {
      _isLoading = false; // Set isLoading to false once response is received
    });
  }
}
