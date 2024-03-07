import 'package:flutter/material.dart';

import '../../utils/ui_constant.dart';

class RegistrationFinal extends StatefulWidget {
  const RegistrationFinal({Key? key});

  @override
  State<RegistrationFinal> createState() => _RegistrationFinalState();
}

class _RegistrationFinalState extends State<RegistrationFinal> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_sharp,
                    size: 120,
                    color: Colors.green,
                  ),
                  const Text(
                    "You’re all done!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text(
                    "Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can set up your inventory.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: bgBtnColor,
                    ),
                    onPressed: () {
                      // registerUser();
                    },
                    child: const Text(
                      "Got it!",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
