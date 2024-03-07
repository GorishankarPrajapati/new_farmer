import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:servicestack/client.dart';

import 'package:software_lab/screens/registration_pages/registration1.dart';

import 'loginpage.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

final List<Widget> onboardpageList = [
  const OnBoardScreen(
    color: Color(0xff5EA25F),
    onboardImagepath: "images/Group 44.png",
    title: "Quality",
    descreption:
        "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ",
  ),
  const OnBoardScreen(
    color: Color(0xffD5715B),
    onboardImagepath: "images/Group.jpg",
    title: "Convenient",
    descreption:
        "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers. ",
  ),
  const OnBoardScreen(
      color: Color(0xffF8C569),
      onboardImagepath: "images/Group 46.jpg",
      title: "Local",
      descreption:
          "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. "),
];
int _currentIndex = 0;

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Set height to screen height
          CarouselSlider(
        items: onboardpageList,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          onPageChanged: (index, _) {
            setState(() {
              _currentIndex = index;
            });
          },
          pageSnapping: true,
          padEnds: true,
          initialPage: 0,
          enlargeCenterPage: false,
          autoPlay: false,
          aspectRatio: 16 / 5,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}

class OnBoardScreen extends StatefulWidget {
  final Color color;
  final String onboardImagepath;
  final String title;
  final String descreption;

  const OnBoardScreen(
      {super.key,
      required this.color,
      required this.onboardImagepath,
      required this.title,
      required this.descreption});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: widget.color,
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              widget.onboardImagepath,
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.descreption,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: onboardpageList.map((item) {
                    int index = onboardpageList.indexOf(item);
                    return Container(
                      width: _currentIndex == index ? 16.0 : 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        shape: BoxShape.rectangle,
                        color: Colors.black,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: widget.color),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Registration1()));
                    },
                    child: const Text(
                      "Join the movement!",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
