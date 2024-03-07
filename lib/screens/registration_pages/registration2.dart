import 'package:flutter/material.dart';
import 'package:software_lab/screens/forgot.dart';
import 'package:software_lab/screens/registration_pages/registration3.dart';
import 'package:software_lab/utils/ui_constant.dart';

class Registration2 extends StatefulWidget {
  final String name;
  final String email;
  final String phnNumber;
  final String password;
  final String confirmPassword;
  Registration2(
      {super.key,
      required this.name,
      required this.email,
      required this.phnNumber,
      required this.password,
      required this.confirmPassword});

  @override
  State<Registration2> createState() => _Registration2();
}

class _Registration2 extends State<Registration2> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _business_name = TextEditingController();
  TextEditingController _informal_name = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _street_address = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _zipcode = TextEditingController();

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
                "Signup 1 of 2",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                "Farm Info",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                            controller: _business_name,
                            decoration: const InputDecoration(
                                hintText: "Business Name",
                                prefixIcon: Icon(
                                  Icons.business,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Business name';
                              } else {
                                return null;
                              }
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
                            controller: _informal_name,
                            decoration: const InputDecoration(
                                hintText: "Informal Name",
                                prefixIcon: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter informal name';
                              } else {
                                return null;
                              }
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
                            controller: _street_address,
                            decoration: const InputDecoration(
                                hintText: "Street Address",
                                prefixIcon: Icon(
                                  Icons.home_outlined,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter street address';
                              } else {
                                return null;
                              }
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
                            controller: _city,
                            decoration: const InputDecoration(
                                hintText: "City",
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter city';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade100),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: TextFormField(
                                controller: _state,
                                decoration: InputDecoration(
                                  hintText: "State",
                                  border: InputBorder.none,
                                  suffixIcon: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade100),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: TextFormField(
                                controller: _zipcode,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: "Enter Zipcode",
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Zipcode';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
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
                                      borderRadius: BorderRadius.circular(25)),
                                  backgroundColor: bgBtnColor),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Registration3(
                                                name: widget.name,
                                                email: widget.email,
                                                phnNumber: widget.password,
                                                password: widget.password,
                                                business_name:
                                                    _business_name.text,
                                                informal_name:
                                                    _informal_name.text,
                                                street_address:
                                                    _street_address.text,
                                                city: _city.text,
                                                state: _state.text,
                                                zipcode: _zipcode.text,
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
