import 'package:flutter/material.dart';
import 'package:retinarisk/Screens/(1)homeScreen.dart';
import 'package:retinarisk/common/utils/colors.dart';

class InsertDataPage extends StatefulWidget {
  const InsertDataPage({super.key});

  @override
  State<InsertDataPage> createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  double _currentSliderValue = 0;
  String _roundedSliderValue = "0";
  String _gender = 'MALE';
  String _type = "1";

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert Data',
          style: TextStyle(fontSize: 23),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          selectedGender: _gender,
                          selectedType: _type,
                          selectedDuration: _roundedSliderValue,
                          selectedChecked: isChecked,
                        )));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "GENDER",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _gender = 'FEMALE';
                          });
                        },
                        child: const Text("Female",
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _gender = 'MALE';
                          });
                        },
                        child:
                            const Text("Male", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DIABETES TYPE",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _type = "1";
                          });
                        },
                        child: const Text(
                          "TYPE 1",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _type = "2";
                          });
                        },
                        child: const Text("TYPE 2",
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "DURATION OF DIABETES (YEARS)",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _roundedSliderValue,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Slider(
                    value: _currentSliderValue,
                    label: _currentSliderValue.round().toString(),
                    max: 100,
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        _roundedSliderValue =
                            _currentSliderValue.round().toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ALREADY HAVE RETIONOPATHY",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                      value: isChecked,
                      activeColor: barColor,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
