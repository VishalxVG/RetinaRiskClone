import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrendsPage extends StatefulWidget {
  const TrendsPage({super.key});

  @override
  State<TrendsPage> createState() => _TrendsPageState();
}

class _TrendsPageState extends State<TrendsPage> {
  String selectedButton = 'Risk';
  String goalSelected = "3.2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        // color: Colors.amberAccent,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Trends",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buttons(),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: selectedButton == 'Risk'
                  ? _riskProgressionMethod()
                  : _bloodPressureMethod(),
            ),
            const SizedBox(
              height: 80,
            ),
            _bottomBox()
          ],
        ),
      ),
    );
  }

  SizedBox _bottomBox() {
    return SizedBox(
      // color: Colors.amberAccent,
      width: double.infinity,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/document.svg",
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "No medical data",
            style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Saved risk calculations will  appear here",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Container _bloodPressureMethod() {
    return Container(
      width: 40,
      // color: Colors.blue,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff92A3FD),
        ),
        child: const Text("ADD MANUALLY"),
      ),
    );
  }

  Container _riskProgressionMethod() {
    return Container(
      width: double.infinity,
      // color: Colors.amber,
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 160,
            height: 30,
            child: Row(
              children: [
                Text(
                  "Current goal :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "data",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff92A3FD),
            ),
            child: const Text("CHANGE GOAL"),
          ),
        ],
      ),
    );
  }

  Container _buttons() {
    return Container(
      padding: const EdgeInsets.only(left: 3, right: 3),
      height: 40,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 190,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedButton = "Risk";
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedButton == "Risk"
                    ? Colors.white
                    : Colors.grey.withOpacity(0.5),
              ),
              child: const Text(
                "Risk Progression",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          SizedBox(
            width: 190,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedButton = "Blood";
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedButton == "Blood"
                    ? Colors.white
                    : Colors.grey.withOpacity(0.5),
              ),
              child: const Text(
                "Blood Pressure",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
