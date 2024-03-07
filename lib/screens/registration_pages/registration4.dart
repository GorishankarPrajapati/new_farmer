import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:software_lab/screens/registration_pages/registration_final.dart';
import '../../utils/ui_constant.dart';

//AIzaSyCh4GxQwxwZxvV9ULvoUeg7JbNpVmvUJVQ
class Registration4 extends StatefulWidget {
  String name;
  String email;
  String phnNumber;
  String password;
  String business_name;
  String informal_name;
  String street_address;
  String city;
  String state;
  String zipcode;
  String pickedFile;
  Registration4(
      {super.key,
      required this.name,
      required this.email,
      required this.phnNumber,
      required this.password,
      required this.business_name,
      required this.informal_name,
      required this.street_address,
      required this.city,
      required this.state,
      required this.zipcode,
      required this.pickedFile});
  @override
  State<Registration4> createState() => _Registration4State();
}

class _Registration4State extends State<Registration4> {
  Map<String, List<String>> businessDays = {
    "M": [],
    "T": [],
    "W": [],
    "Th": [],
    "F": [],
    "S": [],
    "Su": []
  };
  List<String> businessHours = [
    "8:00am - 10:00am",
    "10:00am - 1:00pm",
    "1:00pm - 4:00pm",
    "4:00pm - 7:00pm",
    "7:00pm - 10:00pm",
  ];
  String selectedDay = "M";
  bool _isRegistering = false;

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const Text(
                  "Signup 1 of 4",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Text(
                  "Business Hours",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Text(
                  "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: businessDays.length,
                      itemBuilder: (BuildContext context, int index) {
                        final day = businessDays.keys.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDay = day;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color: selectedDay == day
                                    ? bgBtnColor
                                    : (businessDays[day]!.isNotEmpty
                                        ? Colors.grey.shade300
                                        : null),
                              ),
                              child: Center(child: Text(day)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                if (selectedDay.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4.0,
                          crossAxisSpacing: 6.0,
                          mainAxisSpacing: 6.0,
                        ),
                        itemCount: businessHours.length,
                        itemBuilder: (context, index) {
                          final hour = businessHours[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (businessDays[selectedDay]!.contains(hour)) {
                                  businessDays[selectedDay]!.remove(hour);
                                } else {
                                  businessDays[selectedDay]!.add(hour);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      businessDays[selectedDay]!.contains(hour)
                                          ? const Color(0xffF8C569)
                                          : Colors.grey.shade300),
                              height: 35,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(hour),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: bgBtnColor,
                      ),
                      onPressed: _isRegistering ? null : registerUser,
                      child: _isRegistering
                          ? Center(
                              child: CircularProgressIndicator(
                                color: bgBtnColor,
                              ),
                            )
                          : const Text(
                              "Signup",
                              style: TextStyle(fontSize: 16),
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

  void registerUser() async {
    setState(() {
      _isRegistering = true;
    });

    var url = "https://sowlab.pw/assignment/user/register";

    // Convert businessDays map to JSON
    var businessDaysJson = Map<String, dynamic>.from(businessDays);

    var headers = {'Content-Type': 'application/json'};

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode({
        "full_name": widget.name,
        "email": widget.email,
        "phone": widget.phnNumber,
        "password": widget.password,
        "role": "farmer",
        "business_name": widget.business_name,
        "informal_name": widget.informal_name,
        "address": widget.street_address,
        "city": widget.city,
        "state": widget.state,
        "zip_code": widget.zipcode,
        "registration_proof": widget.pickedFile,
        "business_hours": businessDaysJson,
        "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
        "type": "email",
        "social_id": ""
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        String message = jsonResponse["message"];
        if (message.contains("Registered.")) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$message')));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => RegistrationFinal()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$message')));
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
      _isRegistering = false;
    });
  }
}
