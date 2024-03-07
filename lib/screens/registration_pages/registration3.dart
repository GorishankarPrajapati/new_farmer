import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:software_lab/screens/forgot.dart';
import 'package:software_lab/screens/registration_pages/registration4.dart';
import 'package:software_lab/utils/ui_constant.dart';

class Registration3 extends StatefulWidget {
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

  Registration3(
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
      required this.zipcode});

  @override
  State<Registration3> createState() => _Registration3();
}

class _Registration3 extends State<Registration3> {
  String error = "";
  var pickedFile = '';
  var pickedFileName = '';

  pickFile() async {
    var result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["pdf"]);
    if (result != null) {
      setState(() {
        pickedFile = result.files.single.path!;
        pickedFileName = pickedFile.split('/').last; // Extracting file name
      });
    }
  }

  openFile(file) {
    OpenFile.open(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "FarmerEats",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text(
                      "Signup 1 of 3",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text(
                      "Verification",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Text(
                      "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Attach proof of registration"),
                        InkWell(
                          onTap: () {
                            pickFile();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: bgBtnColor),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    pickedFile.isEmpty
                        ? Text(
                            '$error',
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox(
                            width: 0,
                          ),
                    pickedFileName.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              openFile(
                                  pickedFile); // Passing full path to openFile function
                            },
                            child: Card(
                              elevation: 2,
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(pickedFileName),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          pickedFile = '';
                                          pickedFileName = '';
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
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
                          onPressed: () {
                            if (pickedFile.isEmpty) {
                              setState(() {
                                error = "Please select registration proof";
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Registration4(
                                    name: widget.name,
                                    email: widget.email,
                                    phnNumber: widget.phnNumber,
                                    password: widget.password,
                                    business_name: widget.business_name,
                                    informal_name: widget.informal_name,
                                    zipcode: widget.zipcode,
                                    street_address: widget.street_address,
                                    city: widget.city,
                                    state: widget.state,
                                    pickedFile: pickedFile,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
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
}
